## 1. Overview and Key Components

OIDC is an identity layer built on top of OAuth 2.0. The flow typically involves:

1. Redirecting the user to the Identity Provider (IdP) for login (along with a random `state` parameter).
2. Handling a callback from the IdP that includes an authorization code (and the same `state`).
3. Exchanging the authorization code for tokens (access token, ID token, possibly refresh token).
4. Verifying the tokens, retrieving the user information, and establishing a session in Web Author.

On the **Oxygen XML Web Author** side, you will need to implement:

- **A custom `ApplicationAuthenticationProvider`**  
  This tells Web Author about your new authentication provider (your IdP name, icon, how to start the login, how to handle the callback, etc.).

- **A servlet (or set of servlets) to handle OIDC request flows** (the redirect to the IdP and the callback). For example, a plugin extension that extends `ServletPluginExtension`, or uses a pattern similar to an “OAuth dispatcher,” is typical.

- **Use the `ApplicationUserStore`** to register an authenticated user once you have retrieved and verified the user identity from the IdP.

- **Use the `SessionStore`** to persist transient state (like `state` or tokens) across the login flow.



## 2. High-Level System Architecture

Below is a conceptual depiction of how your plugin will integrate into Oxygen XML Web Author’s authentication flow:

1. **Web Author** displays a login page that includes your **OIDC** authentication option.  
2. When the user clicks “Sign in with OIDC,” Web Author calls your `ApplicationAuthenticationProvider.prepareAuthenticationRedirect(sessionId)` method.  
3. Your provider constructs the **OIDC authorization URL** (using your IdP’s endpoints). You typically embed a **random `state` parameter** in that URL and store it (with the session ID) in `SessionStore`.  
4. User is **redirected** to the IdP’s login page.  
5. After logging in, IdP calls back to your **callback endpoint** in the plugin (a path you define, e.g., `/oidc-callback`).  
6. In that callback, you **verify the `state`**, extract the **authorization code**, and **exchange** it with the IdP’s **token endpoint** for tokens.  
7. You parse the **ID token** (JWT) or call the **UserInfo endpoint** to get user claims (ID, display name, email).  
8. You create an `ApplicationUser` from that info, then call `applicationAuthenticationManager.getApplicationUserStore().authenticateApplicationUser(sessionId, applicationUser)`.  
9. The user is now authenticated in Web Author.
