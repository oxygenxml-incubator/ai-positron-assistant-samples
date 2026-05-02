# Oxygen Framework Documentation Index

## Documentation Base URL

All documentation pages are relative to:

```
https://www.oxygenxml.com/doc/ug-editor/
```

## Documentation Structure

Read from the appropriate page(s) below depending on the user's question. The pages are organized hierarchically — start with the most relevant page and read deeper pages as needed for more detail.

### Framework Extension Scripts (PRIMARY REFERENCE)

- [Creating a Framework Using an Extension Script](topics/framework-customization-script.md): **Start here** - Main documentation for .exf files
  - [Framework Extension Script File](topics/framework-customization-script-usecases.md): Detailed reference for all .exf elements and use cases

### Top-Level Overview

- [Framework (Document Type) and Author Mode Customization](topics/authoring_customization.md): Tutorials and details about customizing frameworks and the visual Author editing mode
- [Creating and Configuring Custom Frameworks](topics/author-devel-guide-intro.md): Overview of framework creation approaches

### Author Mode Customization

- [Author Mode Customization](topics/dg-configuring-author-from-framework.md)
  - [CSS Stylesheets](topics/selecting-combining-multiple-css-styles.md)
  - **Actions**:
    - [Actions](topics/dg-create-custom-actions.md)
    - [Built-in Author Mode Operations](topics/dg-default-author-operations.md)
      - [Arguments of InsertFragmentOperation](topics/dg-author-op-InsertFragmentOperation-arguments.md)
      - [Arguments of SurroundWithFragmentOperation](topics/dg-author-op-SurroundWithFragmentOperation-arguments.md)
    - [Example: Configuring the Insert Section Action](topics/dg-insert-section-action.md)
    - [Example: Configuring the Insert Table Action](topics/dg-insert-table-action.md)
    - [Using Retina/HiDPI Icons](topics/adding-retina-hidpi-images-framework.md)
  - [Content Completion for Author Mode Only](topics/dg-configure-content-completion.md)
  - [Text to Markup Shortcut Patterns](topics/customizing-structure-insertion.md)
  - [Smart Paste](topics/author-customize-smart-paste.md)

### Content Completion Assistant

- [Content Completion Assistant](topics/dg_customize_the_content_completion_assistant.md)
  - [Customizing Using a Configuration File](topics/customize-content-completion.md)
    - [Configuring Proposals for Elements and Attributes](topics/configure-elements-attr-cc-individually.md)
    - [Configuring Proposals for Attribute and Element Values](topics/configuring-content-completion-proposals.md)
    - [Customizing the Rendering of Elements](topics/rendering-elements-cc-author.md)
    - [Customizing Annotations](topics/author-styleguide-annotations.md)

### Framework Configuration (Scenarios, Templates, Catalogs, Localization)

- [Transformation Scenarios](topics/dg-transformation-scenarios.md)
- [Validation Scenarios](topics/dg-validation-scenarios.md)
- [Document Templates](topics/dg-file-templates.md)
- [XML Catalogs](topics/dg-xml-catalogs.md)
- [Localization](topics/localizing_frameworks.md)

### Sharing a Framework

- [Sharing a Framework](topics/author-document-type-extension-sharing.md)
  - [Packing and Deploying Frameworks as Add-ons](topics/packing-and-deploying-addons.md)

### CSS Support in Author Mode

- [CSS Support in Author Mode](topics/dg-css-support-in-author.md)
  - [Associating a CSS with an XML Document](topics/dg-css-stylesheet.md)
  - [Handling CSS Imports](topics/handling-css-imports.md)
  - [Displaying Processing Instructions from Other Editors](topics/show-external-pis.md)
  - [Specifying Media Types in the CSS](topics/dg-oxygen-media-type.md)
  - **CSS At-Rules**:
    - [CSS At-Rules](topics/dg-standard-css-at-rules.md)
    - [@font-face At-Rule](topics/dg-font-face-media.md)
    - [@media Rule](topics/dg-media-at-rule.md)
  - **Standard W3C CSS Features**:
    - [Standard W3C CSS Supported Features](topics/dg-standard-css-support.md)
    - **Selectors**:
      - [Supported CSS Selectors](topics/dg-supported-selectors.md)
      - [Namespace Selector](topics/dg-namespace-selectors.md)
      - [Subject Selector](topics/dg-subject-selector.md)
      - [:has Relational Pseudo-Class](topics/has-selector.md)
    - **Properties**:
      - [Supported CSS Properties](topics/dg-properties-support.md)
      - [Transparent Colors](topics/transparent-colors.md)
      - [attr() Function](topics/dg-attr-function.md)
      - [target-counter() and target-counters() Functions](topics/dg-target-counter-function.md)
      - [calc() Function](topics/dg_calc_function.md)
    - [Custom CSS Properties (CSS Variables)](topics/css_custom_properties.md)
  - **CSS Extensions (Oxygen-specific)**:
    - [CSS Extensions](topics/dg-oXygen-css-extensions.md)
    - [Built-in CSS Selectors](topics/builtin-css-selectors.md)
    - [Additional CSS Selectors](topics/dg-additional-custom-selectors.md)
    - **Additional CSS Properties**:
      - [Additional CSS Properties](topics/dg-css-additional-properties.md)
      - [-oxy-append-content / -oxy-prepend-content](topics/dg-oxygen-extension-properties.md): Append specified content
      - [-oxy-collapse-text](topics/dg-visibility-css-extension.md): Collapse element content
      - [-oxy-lower-cyrillic](topics/dg-list-style-type-css-extension.md): Cyrillic counters for lists
      - [-oxy-display-tags](topics/dg-display-tags.md): Control tag marker display
      - [-oxy-editable](topics/dg-editable-css-extension.md): Inhibit editing of element content
      - [-oxy-floating-toolbar](topics/floating-toolbar-property.md): Display floating toolbar in Author mode
      - [-oxy-foldable / -oxy-folded / -oxy-not-foldable-child](topics/dg-folding-elements.md): Configure element folding
      - [-oxy-link](topics/dg-link-elements.md): Specify element as a link
      - [-oxy-link-activation-trigger](topics/oxy-link-activation-trigger.md): Hyperlink handling in Author mode
      - [-oxy-morph](topics/dg-morph-css-extension.md): Display element inline
      - [-oxy-placeholder-content](topics/dg-placeholder-css-extension.md): Placeholders for empty elements
      - [-oxy-style](topics/dg-style-element-property.md): Configure element style
      - [-oxy-tags-color](topics/custom-colors-for-element-tags.md): Tag background/foreground colors
    - **Custom CSS Functions**:
      - [Custom CSS Functions](topics/dg-oxygen-css-functions.md)
      - [Arithmetic Functions](topics/dg-css-arithmetic-functions.md)
      - [oxy_action()](topics/dg-action-function.md): Define actions directly in CSS
      - [oxy_action_list()](topics/dg-action-list-function.md): Define sequential action lists in CSS
      - [oxy_attributes()](topics/dg-attributes-function.md): Concatenate element attributes
      - [oxy_base-uri()](topics/dg-base-uri-function.md): Evaluate base URL
      - [oxy_capitalize()](topics/dg-capitalize-function.md): Capitalize first letter
      - [oxy_compound_action()](topics/dg-compound-action-function.md): Define multiple sequential actions
      - [oxy_concat()](topics/dg-concat-function.md): Concatenate strings
      - [oxy_getSomeText()](topics/dg-getsometext-function.md): Truncate long strings
      - [oxy_indexof()](topics/dg-index-of-function.md): Search in strings
      - [oxy_label()](topics/dg-oxy-label-function.md): Style generated text
      - [oxy_lastindexof()](topics/dg-last-index-of-function.md): Last occurrence search
      - [oxy_link-text()](topics/dg-oxy-link-text.md): Get text from reference source
      - [oxy_local-name()](topics/dg-local-name-function.md): Get local name of current node
      - [oxy_lowercase()](topics/dg-lowercase-function.md): Transform to lowercase
      - [oxy_name()](topics/dg-name-function.md): Get qualified name of current node
      - [oxy_parent-url()](topics/dg-parent-url-function.md): Get parent URL
      - [oxy_replace()](topics/dg-replace-function.md): Replace text
      - [oxy_substring()](topics/dg-substring-function.md): Get substring
      - [oxy_unescapeURLValue()](topics/dg-oxy-unescapeURLValue.md): Unescape URL string
      - [oxy_unparsed-entity-uri()](topics/dg-unparsed-entity-uri-function.md): Get unparsed entity URI
      - [oxy_uppercase()](topics/dg-uppercase-function.md): Transform to uppercase
      - [oxy_url()](topics/dg-url-function.md): Extended URL function with relative paths
      - [oxy_xpath()](topics/dg-xpath-function.md): Evaluate XPath expressions
    - **Form Controls**:
      - [Form Controls](topics/form-controls.md)
      - [oxy_audio](topics/oxy-audio-form-control.md): Audio file player
      - [oxy_browser](topics/oxy-browser-form-control.md): HTML/SVG browser integration
      - [oxy_button](topics/button-editor.md): Button invoking Author mode actions
      - [oxy_buttonGroup](topics/button-group-editor.md): Group of action buttons
      - [oxy_checkbox](topics/check-box-editor.md): Checkbox for attribute/element values
      - [oxy_combobox](topics/combo-box-editor.md): Drop-down menu of proposed values
      - [oxy_datePicker](topics/date-picker-editor.md): Date picker with calendar
      - [oxy_htmlContent](topics/html-content-form-control.md): Render HTML content
      - [oxy_popup](topics/pop-up-editor.md): Contextual menu for quick actions
      - [oxy_textArea](topics/dg-text-area-form-control.md): Multi-line text input
      - [oxy_textfield](topics/text-field-editor.md): Single-line text input
      - [oxy_urlChooser](topics/url-chooser-editor.md): URL/resource location chooser
      - [oxy_video](topics/oxy-video-form-control.md): Video player
      - [Implementing Custom Form Controls](topics/implementing-custom-form-controls.md): Custom Java form controls
      - [Editing Processing Instructions Using Form Controls](topics/editing-pis-using-form-controls.md)
    - [Custom CSS Pseudo-classes](topics/dg-custom-css-pseudo-classes.md)
    - [Using :before(n) and :after(n) Pseudo-Elements](topics/ch_advanced_styling_multiple_before_and_after_pseudo_elements.md)
  - [Debugging CSS Stylesheets](topics/debugging-css-stylesheets.md)
