# EXF Framework Extension Script Reference

## Schema References

The `schemas/` folder contains the authoritative XML Schema and Schematron files that define the structure of framework-related XML files. **Consult these schemas when generating or validating EXF files, author action files, or content completion configuration files** to ensure correctness of element names, attribute names, allowed values, and structural constraints.

- **`schemas/frameworkExtensionScript.xsd`** — XML Schema for `.exf` framework extension script files. Defines all allowed elements and attributes for the `<script>` root element in the `http://www.oxygenxml.com/ns/framework/extend` namespace. Consult this for the complete structure of EXF files including: `name`, `description`, `priority`, `associationRules`, `defaultSchema`, `classpath`, `xmlCatalogs`, `author` (CSS, toolbars, menus, contextual menus, content completion, author actions), `documentTemplates`, `transformationScenarios`, `validationScenarios`, `extensionPoints`, and `webResources`.
- **`schemas/frameworkExtensionScript.sch`** — Schematron rules for `.exf` files. Validates that: the `@base` attribute is non-empty if present, the framework `name` is non-empty, content completion `addAction` elements specify at least one of `@inCCWindow`, `@inElementsView`, or `@inMenus`, and extension points are not duplicated.
- **`schemas/authorAction.xsd`** — XML Schema for external author action XML files (placed in `{scriptName}_externalAuthorActions/` folder). Defines the `<authorAction>` root element in the `http://www.oxygenxml.com/ns/author/external-action` namespace with: `@id` (required), `name`, `description`, `smallIconPath`, `largeIconPath`, `accessKey`, `accelerator`, `enabledInReadOnlyContext`, and `operations` (containing one or more `operation` elements each with `@id` for the operation class, optional `xpathCondition`, and `arguments`).
- **`schemas/ccConfigSchemaFilter.xsd`** — XML Schema for content completion configuration files (`cc_config.xml`). Defines the `<config>` root element in the `http://www.oxygenxml.com/ns/ccfilter/config` namespace with: `elementProposals` (control which child elements/attributes are inserted or proposed), `valueProposals` (provide custom attribute/text values), and `elementRenderings` (customize how elements appear in the content completion assistant).
- **`schemas/ccConfigSchemaFilter.sch`** — Schematron rules for content completion configuration files. Validates `<match>` element usage and suggests using `<valueProposals>` instead of the deprecated `<match>` element.

## EXF File Structure Summary

A `.exf` file uses the root element `<script>` in namespace `http://www.oxygenxml.com/ns/framework/extend`. Key structural points:

- **`@base`** (optional) — Name of the base framework to extend (e.g., `"DITA"`, `"DocBook"`, `"TEI"`). Omit to create a standalone framework.
- **`<name>`** (required) — Framework name.
- **`<description>`** (required) — Framework description.
- **`<priority>`** — `Lowest`, `Low`, `Normal`, `High`, `Highest`.
- **`<associationRules>`** — Contains `<addRule>` elements with attributes: `@rootElementLocalName`, `@namespace`, `@fileName`, `@publicID`, `@attributeLocalName`, `@attributeNamespace`, `@attributeValue`, `@javaRuleClass`. Use `@inherit="none"` to discard base rules.
- **`<defaultSchema>`** — `@schemaType` (`dtd`, `xmlschema`, `rng`, `rnc`, `sch`, etc.) and `@href`.
- **`<classpath>`** — `<addEntry path="..."/>` and `<removeEntry path="..."/>`. Supports `@inherit` and `@parentClassLoaderID`.
- **`<xmlCatalogs>`** — `<addEntry path="..."/>` and `<removeEntry path="..."/>`.
- **`<documentTemplates>`** — `<addEntry path="..."/>` and `<removeEntry path="..."/>`.
- **`<author>`** — Container for Author mode customizations:
  - **`<css>`** — `<addCss path="..." alternate="true/false" title="..."/>`, `<removeCss path="..."/>`.
  - **`<toolbars>`** — `<toolbar name="...">` containing `<addAction id="..."/>`, `<separator/>`, `<group>`, `<removeAction>`, `<removeGroup>`.
  - **`<menu>`** — `<addAction>`, `<submenu>`, `<separator>`, `<removeAction>`, `<removeSubmenu>`.
  - **`<contextualMenu>`** — Same structure as `<menu>`.
  - **`<contentCompletion>`** — Contains `<schemaProposals>` (`<addProposal>`, `<removeProposal>`) and `<authorActions>` (`<addAction id="..." inCCWindow="true" replacedElement="..."/>`).
  - **`<authorActions>`** — `<removeAction id="..."/>` to remove inherited actions.
- **`<transformationScenarios>`** / **`<validationScenarios>`** — `<addScenarios href="..."/>`, `<removeScenario name="..."/>`, `<defaultScenarios>`.
- **`<extensionPoints>`** — `<extension name="extensionsBundle" value="com.example.MyExtensionsBundle"/>` and other Java extension points.

The `@inherit` attribute (values: `"all"` or `"none"`) controls whether entries from the base framework are inherited. The `@position` attribute (`"before"` or `"after"`) controls insertion order relative to inherited entries.

Use `${framework}` or `${frameworkDir}` in paths to reference resources relative to the framework directory.

## External Author Action File Structure Summary

Author action files use root element `<authorAction>` in namespace `http://www.oxygenxml.com/ns/author/external-action`. Key structure:

- **`@id`** (required) — Unique action identifier, used to reference the action from toolbars, menus, and content completion.
- **`<name>`** (required) — Display name of the action.
- **`<description>`** — Tooltip text.
- **`<smallIconPath>`** / **`<largeIconPath>`** — Icon paths (use `${framework}` for relative paths, or `/path` for classpath resources).
- **`<accelerator>`** — Keyboard shortcut (e.g., `"M1+M2+T"` where M1=Cmd/Ctrl, M2=Shift, M3=Alt/Option).
- **`<operations>`** — Contains one or more `<operation>` elements:
  - **`@id`** (required) — Fully qualified Java class name or built-in operation short name (e.g., `"InsertFragmentOperation"`).
  - **`<xpathCondition>`** — XPath 2.0 expression to activate this operation mode.
  - **`<arguments>`** — Contains `<argument name="...">value</argument>` elements.

These files must be placed in a folder named `{exf-script-name}_externalAuthorActions/` next to the `.exf` file (or in `externalAuthorActions/` at the framework directory level).

## Sample EXF Files

Refer to these sample files in the `samples/` folder for practical examples:

- **`samples/extend-dita-qa.exf`** - Extends DITA for Q/A topics. Demonstrates: association rules, document templates, toolbar actions, content completion, menus, and removing inherited actions.
- **`samples/extend-dita-with-css-and-classpath.exf`** - Extends DITA with custom CSS and classpath. Demonstrates: CSS customization (add/remove stylesheets, alternate styles), classpath modifications, validation scenarios, Java extensions bundle, toolbar/contextual menu customization.
- **`samples/extend-dita-map-resolved.exf`** - Extends DITA for resolved topic references. Demonstrates: Java rule matcher for association, transformation/validation scenarios, extensions bundle configuration.
- **`samples/custom-json-framework.exf`** - Standalone framework for custom JSON documents. Demonstrates: extending a non-XML base framework (JSON), custom Java rule matcher (`javaRuleClass`) for association, `parentClassLoaderID` for classpath sharing with plugins, JSON schema association (`schemaType="json_schema"`), document templates, and `selectMultipleAlternateCSS` for allowing multiple alternate CSS styles.

## Sample External Author Action Files

Custom Author actions are defined in separate XML files placed in a folder named `{framework-name}_externalAuthorActions` relative to the `.exf` file. Refer to these samples in `samples/actions/`:

- **`insert.qagroup.xml`** - Simple InsertFragmentOperation with XML fragment
- **`insert.section.xml`** - Multiple operations with XPath conditions for context-aware insertion
- **`insert.note.xml`** - Combines InsertFragmentOperation and SurroundWithFragmentOperation
- **`insert.table.xml`** - InsertFragmentOperation with multi-line XML fragment and ${caret} positioning
- **`insert.topicref.xml`** - Custom Java operation with XPath condition

## Sample CSS for Author Mode Form Controls

Refer to this sample CSS file for examples of visual editing features in Author mode:

- **`samples/css/author-mode-form-controls.css`** - Demonstrates Oxygen-specific CSS form controls and visual editing features including: `oxy_combobox` for dropdown selection with tooltips, `oxy_urlChooser` for file browsing, `oxy_editor` with `oxy_action` for insert buttons, `-oxy-placeholder-content` for placeholder text in empty elements, `-oxy-collapse-text` for hiding raw text behind form controls, `-oxy-not-foldable-child` for controlling element folding, and label pseudo-elements with `:before`.
