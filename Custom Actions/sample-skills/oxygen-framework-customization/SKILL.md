---
name: oxygen-framework-customization
description: Use this skill when asked for help about building, configuring, or customizing Oxygen XML Editor/Author desktop frameworks (document type associations), including Author mode visual editing customization, CSS styling, custom actions, content completion, form controls, Java extensions, transformation/validation scenarios, and framework sharing/deployment.
profile: xml_editor, xml_author
---

# Oxygen XML Framework Customization Skill

## Purpose

This skill provides access to the official Oxygen XML Editor documentation for building and customizing frameworks (document type associations). Use it when users ask questions about:

- Creating and configuring custom frameworks (document types)
- Extending existing frameworks
- Framework extension scripts
- Author mode visual editing customization
- CSS stylesheets for Author mode (including custom CSS properties, selectors, functions, and extensions)
- Custom Author mode actions and operations
- Content completion assistant customization
- Form controls in Author mode
- Toolbars, menus, and contextual menus
- Transformation and validation scenarios in frameworks
- Document templates
- XML catalogs in frameworks
- Framework localization
- Java extensibility (extensions bundle, custom operations, drag-and-drop, references, tables, etc.)
- Sharing and deploying frameworks as add-ons
- Debugging CSS stylesheets

## CRITICAL: Use Framework Extension Scripts (.exf), NOT .framework Files

**IMPORTANT FOR AI ASSISTANTS**: When creating framework customizations for users, you **MUST** use **Framework Extension Script (.exf)** files. 

There are two ways to create/configure frameworks in Oxygen:

1. **`.framework` files** - Created via the application's GUI dialog (Options > Preferences > Document Type Association). These are binary/complex XML files that are **NOT suitable for programmatic creation by AI assistants**.

2. **`.exf` files (Framework Extension Scripts)** - Text-based XML scripts that extend existing frameworks. These are **the ONLY option for AI assistants** to create framework customizations because:
   - They are human-readable XML files
   - They can extend any existing built-in framework (DITA, DocBook, TEI, etc.)
   - They support all customization features: CSS, actions, toolbars, menus, content completion, validation/transformation scenarios, etc.
   - They are easy to version control and share

**Always create `.exf` files when users ask for framework customizations.**

## Installing a Framework Created by the AI Assistant

After the AI assistant creates a framework folder containing the `.exf` file and related resources, instruct the user to install it in Oxygen XML Editor as follows:

### Step 1: Configure the Framework Location

1. In Oxygen XML Editor, open **Options > Preferences**
2. Navigate to **Document Type Association > Locations**
3. In the **Additional frameworks directories** section, click **Add**
4. Browse to and select the folder containing the framework (the folder that contains the `.exf` file)
5. Click **OK** or **Apply** to save your changes

The framework extension script will now be automatically discovered and loaded by Oxygen XML Editor. The framework will appear in the **Document Type Association** preferences page and will be active for documents matching its association rules.

> **Note**: If the framework extends an existing built-in framework (e.g., DITA, DocBook), the customizations will be applied on top of the base framework automatically.

## Detailed Reference Files

This skill is organized into multiple reference files. Read the appropriate file(s) based on the user's question:

- **[exf-reference.md](exf-reference.md)** — EXF file structure, schema references, external author action file structure, and sample files. **Read this when creating or editing `.exf` files or author actions.**
- **[documentation-index.md](documentation-index.md)** — Complete index of official Oxygen documentation pages organized by topic area. **Read this to find the right documentation page for the user's question.**
- **[blog-references.md](blog-references.md)** — Supplementary blog topics with practical examples. **Read this for additional examples and implementation patterns.**

## Instructions

**IMPORTANT**: When answering questions using this skill, do NOT use project search tools (like `search_project_resources` or `grep_project`). All necessary information is available in the official documentation URLs provided in the reference files and the sample files. Read directly from these sources.

### How to Use This Documentation

1. **Identify the topic area** from the user's question (e.g., CSS styling, custom actions, form controls, Java extensions).
2. **Read the EXF reference** (`exf-reference.md`) when creating or modifying framework extension scripts or author actions.
3. **Consult the documentation index** (`documentation-index.md`) to find the most relevant official documentation page(s), then read them using the `get_document_content` tool with the `.md` extension URLs.
4. **Read deeper pages** if the top-level page does not contain enough detail.
5. **Check blog references** (`blog-references.md`) for supplementary practical examples when needed.

## Response Requirements

- **Always include source links**: Every response must reference the URL(s) from which information was obtained. Use the `.md` extension for official documentation URLs and direct blog topic URLs for blog references.
- **Cite specific documentation pages**: Help users find more details by providing direct links.
- **Use blog references selectively**: When relevant, supplement official documentation with one or more Oxygen XML Blog topics that provide practical examples, implementation patterns, or broader context for framework customization.
- **Acknowledge limitations**: If the documentation does not contain relevant information, inform the user and suggest alternative approaches.
- **For CSS questions**: Check both the standard W3C CSS section and the CSS Extensions section, as Oxygen provides many custom CSS properties and functions beyond standard CSS.
- **For action questions**: Check both the declarative actions section and the Java extensibility section, as actions can be configured either way.
- **Always include installation instructions**: When creating a new framework for the user, include the installation steps from the "Installing a Framework" section above so the user knows how to activate it in Oxygen.
