## 1. Overview and Key Components

OIDC is an identity layer built on top of OAuth 2.0. The flow typically involves:

1. Redirecting the user to the Identity Provider (IdP) for login (along with a random `state` parameter).
2. Handling a callback from the IdP that includes an authorization code (and the same `state`).
3. Exchanging the authorization code for tokens (access token, ID token, possibly refresh token).
4. Verifying the tokens, retrieving the user information, and establishing a session in Web Author.

On the **Oxygen XML Web Author** side, you will need to implement:

- **A custom `ApplicationAuthenticationProvider`**  
  This tells Web Author about your new authentication provider (your IdP name, icon, how to start the login, how to handle the callback, etc.).

- **A servlet (or set of servlets) to handle OIDC request flows** (the redirect to the IdP and the callback). For example, a plugin extension that extends `ServletPluginExtension`, or uses a pattern similar to an "OAuth dispatcher," is typical.

- **Use the `ApplicationUserStore`** to register an authenticated user once you have retrieved and verified the user identity from the IdP.

- **Use the `SessionStore`** to persist transient state (like `state` or tokens) across the login flow.

Core API classes/interfaces you will work with and their roles:

1. **`ro.sync.ecss.webapp.auth.ApplicationAuthenticationProvider`**  
   - **Purpose**: Represents an authentication method (e.g., "OIDC Login", "GitHub Login", etc.) recognized by Web Author.  
   - **Key Methods**:  
     - `String getName()` - Return the name (e.g., "OIDC").  
     - `String getIcon()` - Return a relative path to an icon to be shown in the Web Author login UI.  
     - `String getCallbackPath()` - Return the URL path that Web Author will open after the user completes authentication.  
     - `URL prepareAuthenticationRedirect(String sessionId)` - Return where the user should be redirected to begin authentication, given the current session.  
     - `boolean isAskingForAuthorization()` - Indicate if the user explicitly needs to grant access (often `true` for OAuth/OIDC flows).

2. **`ro.sync.ecss.webapp.auth.ApplicationAuthenticationManager`**  
   - **Purpose**: Coordinates all authentication providers and manages the overall Web Author login system.  
   - **Usage**: From within your plugin code, you can retrieve the manager and notify it when a user is authenticated.

3. **`ro.sync.ecss.webapp.auth.ApplicationUser`**  
   - **Purpose**: A representation of an authenticated user inside Web Author. It includes an `id`, a `displayName`, an `email`, etc. You will construct this once you have determined the user's identity from OIDC tokens.

4. **`ro.sync.ecss.webapp.auth.ApplicationUserStore`**  
   - **Purpose**: Storage for the `ApplicationUser` objects once they are authenticated. The store manages linking an authenticated user to a particular session (identified by `sessionId`).

5. **`ro.sync.ecss.extensions.api.webapp.SessionStore`**  
   - **Purpose**: Per-session storage. Ideal for storing "state" values, tokens, or any short-lived data you need across requests.  
   - **Usage**: You can put and get arbitrary objects keyed by `(sessionId, "someCustomKey")`.

6. **`ro.sync.ecss.extensions.api.webapp.plugin.servlet.ServletPluginExtension`**  
   - **Purpose**: Base class for implementing HTTP endpoints (servlets) in a plugin.  
   - **Usage**: You typically override `doGet` / `doPost` methods to handle the OIDC callback, code exchange, token refresh, or any other OIDC actions.

7. **`ro.sync.ecss.extensions.api.webapp.plugin.servlet.http.HttpServletRequest` / `HttpServletResponse`**  
   - **Purpose**: The request/response objects you handle within your servlet extension.  
   - **Usage**: Extract parameters (`state`, `code`, etc.), produce redirects, or generate responses.

---

## 2. High-Level System Architecture

Below is a conceptual depiction of how your plugin will integrate into Oxygen XML Web Author's authentication flow:

1. **Web Author** displays a login page that includes your **OIDC** authentication option.  
2. When the user clicks "Sign in with OIDC", Web Author calls your `ApplicationAuthenticationProvider.prepareAuthenticationRedirect(sessionId)` method.  
3. Your provider constructs the **OIDC authorization URL** (using your IdP's endpoints). You typically embed a **random `state` parameter** in that URL and store it (with the session ID) in `SessionStore`.  
4. User is **redirected** to the IdP's login page.  
5. After logging in, IdP calls back to your **callback endpoint** in the plugin (a path you define, e.g., `/oidc-callback`).  
6. In that callback, you **verify the `state`**, extract the **authorization code**, and **exchange** it with the IdP's **token endpoint** for tokens.  
7. You parse the **ID token** (JWT) or call the **UserInfo endpoint** to get user claims (ID, display name, email).  
8. You create an `ApplicationUser` from that info, then call `applicationAuthenticationManager.getApplicationUserStore().authenticateApplicationUser(sessionId, applicationUser)`.  
9. The user is now authenticated in Web Author.

---

## 3. Step-by-Step Implementation

### 3.1 Create Your `ApplicationAuthenticationProvider`

You need a class that implements `ro.sync.ecss.webapp.auth.ApplicationAuthenticationProvider`. Minimal outline:

```java
import ro.sync.ecss.webapp.auth.ApplicationAuthenticationProvider;
import ro.sync.ecss.webapp.auth.ApplicationUser;
import ro.sync.ecss.webapp.auth.ApplicationUserStore;
// other imports...

public class OidcAuthenticationProvider implements ApplicationAuthenticationProvider {
  @Override
  public String getName() {
    // For example:
    return "OIDC Login";
  }

  @Override
  public String getIcon() {
    // Path to your icon (relative to your plugin's "resources" folder, typically):
    return "../plugin-resources/oidc/oidc-icon.png";
  }

  @Override
  public String getCallbackPath() {
    // The relative path from your plugin that handles the OIDC callback:
    // E.g., "../plugins-dispatcher/my-oidc-callback"
    return "../plugins-dispatcher/my-oidc";
  }

  @Override
  public URL prepareAuthenticationRedirect(String sessionId) {
    // Construct the OIDC Authorization URL: https://your-oidc-provider/authorize?
    //   client_id=...&amp;redirect_uri=...&amp;scope=...&amp;state=... etc.
    // Return a fully qualified URL object.
    return buildOidcAuthorizationUrl(sessionId);
  }

  @Override
  public boolean isAskingForAuthorization() {
    // Typically true for OIDC
    return true;
  }
}
```

**Key Points**:

- The `prepareAuthenticationRedirect` method **must** return a `java.net.URL` that points to your IdP's "authorize" endpoint.  
- You will generate and store a `state` parameter in some per-session location (like `SessionStore`) to protect from CSRF attacks.  
- The `getCallbackPath()` method should match the path of your actual plugin servlet that receives the callback.

### 3.2 Create a Servlet (Plugin Extension) for the Callback

In your plugin descriptor, you can define a servlet extension that extends `ServletPluginExtension` (or more specifically `HttpServlet`-like classes from the Oxygen Webapp API). For example:

```java
import ro.sync.ecss.extensions.api.webapp.plugin.servlet.ServletPluginExtension;
import ro.sync.ecss.extensions.api.webapp.plugin.servlet.http.HttpServletRequest;
import ro.sync.ecss.extensions.api.webapp.plugin.servlet.http.HttpServletResponse;

public class OidcCallbackServlet extends ServletPluginExtension {
  
  @Override
  public String getPath() {
    // Must match the path that your OidcAuthenticationProvider returns in getCallbackPath().
    return "my-oidc";
  }

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    // 1. Extract parameters: "state", "code", etc.
    // 2. Compare "state" to what you stored in SessionStore.
    // 3. Exchange "code" for tokens on the IdP's token endpoint.
    // 4. Retrieve user information from the ID token or userinfo endpoint.
    // 5. Construct an ApplicationUser.
    // 6. Mark them as authenticated in Web Author.
  }
}
```

**Implementation details**:

1. **Validate `state`**:  
   Retrieve the saved `state` from `SessionStore` using `sessionId`. Compare it with `request.getParameter("state")`. If they differ, reject the request.

2. **Exchange code for tokens**:  
   Perform an HTTP POST to your IdP's **token endpoint**. Usually:
   ```
   POST /token
   grant_type=authorization_code
   code=&lt;the_auth_code>
   redirect_uri=&lt;the_callback_url>
   client_id=&lt;your_client_id>
   client_secret=&lt;your_client_secret>
   ```
   The response should include an **access_token**, **id_token**, possibly a **refresh_token**.

3. **Parse user identity**:  
   - If you get an **ID token** (which is a JWT), verify its signature, decode it (or use a library). Extract `sub` (subject), `name`, `email`, etc.  
   - Alternatively, if the IdP returns an **access token** that can be used to call a **UserInfo endpoint**, call that endpoint to retrieve the user's identity.

4. **Authenticate with Web Author**:  
   - Get the `sessionId` from `request.getSession().getId()`.  
   - Create an `ApplicationUser`:
     ```java
     ApplicationUser user = new ApplicationUser(
        userIdFromIdToken,
        displayNameFromIdToken,
        emailFromIdToken
     );
     ```
   - Retrieve the `ApplicationUserStore`:
     ```java
     ApplicationUserStore userStore = 
       applicationAuthenticationManager.getApplicationUserStore();
     ```
   - Associate the user with the session:
     ```java
     userStore.authenticateApplicationUser(sessionId, user);
     ```
   - At this point, the user is recognized by Web Author as "logged in."

5. **Redirect or close**:  
   - If this is a normal authentication flow (logging in the main application), redirect to some page in Web Author to continue.  
   - If it's a pop-up window for connecting an external account, you might send an HTML response that simply closes the pop-up.

### 3.3 Storing Temporary State (SessionStore)

Use `SessionStore` whenever you need to store ephemeral data (like the random `state` parameter, tokens, or anything else) for a particular session. For example:

```java
import ro.sync.ecss.extensions.api.webapp.SessionStore;
// ...
SessionStore sessionStore = pluginWorkspace.getSessionStore();
String sessionId = request.getSession().getId();

// Save:
sessionStore.putWithoutSessionCookieRefresh(sessionId, "oidc.state", randomStateValue);

// Retrieve:
Object savedState = sessionStore.get(sessionId, "oidc.state");

// Remove after usage:
sessionStore.remove(sessionId, "oidc.state");
```

### 3.4 Token Refresh (Optional)

If you need to handle token refresh (i.e., you received a `refresh_token`), you can create another endpoint or method in your servlet to:

1. Retrieve the stored refresh token from `SessionStore`.  
2. Call the IdP token endpoint with `grant_type=refresh_token`.  
3. Update the stored tokens for the user.  

Whether you actually need to do this depends on your IdP's configuration and the user experience you want.

### 3.5 Plugin Registration

Finally, ensure you declare your new classes (the `ApplicationAuthenticationProvider` and the servlet) in the **plugin descriptor** (the `plugin.xml` for the Web Author plugin). For example, you might have:

```xml
&lt;extensions>
  &lt;!-- Application Authentication Provider extension -->
  &lt;extension type="com.oxygenxml.webapp.auth.provider">
    &lt;class>com.example.oidc.OidcAuthenticationProvider&lt;/class>
  &lt;/extension>

  &lt;!-- Servlet extension to handle the callback and other OIDC endpoints -->
  &lt;extension type="com.oxygenxml.webapp.servlet">
    &lt;class>com.example.oidc.OidcCallbackServlet&lt;/class>
  &lt;/extension>
&lt;/extensions>
```

When you deploy your plugin, Web Author will discover your authentication provider and your servlet. The "OIDC Login" option will appear in the login UI. When clicked, it will call `prepareAuthenticationRedirect`, then your user will be redirected to your IdP. After logging in, they come back to your callback servlet, which performs the code exchange and finishes logging them in.

---

## 4. Putting It All Together

The overall sequence is:

1. **User clicks** "Sign in with OIDC."  
2. **Web Author** calls `OidcAuthenticationProvider.prepareAuthenticationRedirect(...)`.  
3. **Provider** returns the OIDC `authorize` endpoint.  
4. **User** logs into the IdP, which then **redirects** to your plugin's `/my-oidc` callback.  
5. **`OidcCallbackServlet`** verifies the request, exchanges the code for tokens, identifies the user, and calls `authenticateApplicationUser(...)` on the `ApplicationUserStore`.  
6. **User** is now recognized by Web Author as authenticated with a user identity from OIDC.  

At this point, any standard Web Author features that rely on "the current user" will see your user's name/email.

---

## 5. Summary of API References

- **`ro.sync.ecss.webapp.auth.ApplicationAuthenticationProvider`**  
  Implement to describe your OIDC login option.

- **`ro.sync.ecss.webapp.auth.ApplicationAuthenticationManager`**  
  Access it (usually from the plugin workspace) to get the `ApplicationUserStore`.

- **`ro.sync.ecss.webapp.auth.ApplicationUser`**  
  The model object for an authenticated user.

- **`ro.sync.ecss.webapp.auth.ApplicationUserStore`**  
  Lets you mark a user as authenticated (or logged out) for a session.

- **`ro.sync.ecss.extensions.api.webapp.SessionStore`**  
  Key-value store per session, used for your `state` parameter, tokens, etc.

- **`ro.sync.ecss.extensions.api.webapp.plugin.servlet.ServletPluginExtension`**  
  Extend this to create a servlet for your OIDC callback and token management.

- **`ro.sync.ecss.extensions.api.webapp.plugin.servlet.http.HttpServletRequest`** and **`HttpServletResponse`**  
  The request/response classes you implement in your servlet's `doGet`/`doPost`.

By following these guidelines, you can implement an OIDC-based login flow entirely within a custom plugin for Oxygen XML Web Author. All references above are part of the **public API**, so no proprietary code is necessary. 

---

### Additional Tips

- **Token verification**:  Use a JWT library to parse/verify ID tokens if your IdP issues them.  
- **HTTPS**: Always use HTTPS endpoints for real deployments.  
- **Session management**: If you want to keep the user's credentials for later calls, store them securely in the `SessionStore` or as needed.  
- **Error handling**: Ensure you gracefully handle cases where a user denies consent or an error occurs in the OIDC flow.

That's it! With this tutorial, you should have a good handle on how to create and register a plugin that provides OIDC-based authentication to Oxygen XML Web Author using only the **public** Web Author plugin API.

