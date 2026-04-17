---
name: summarize-as-bullet-points
description: Summarize XML document content as a concise bullet-point list. Use this skill when the user asks to summarize or create a bullet-point overview of an XML document or selected content.
---

# Summarize as Bullet Points

## Purpose

This skill summarizes the content of an XML document (or a selected portion of it) into a concise, easy-to-read bullet-point list. It is useful for quickly understanding the key points of a topic without reading the full content.

## Instructions

1. If the user provides a selection, summarize only the selected content. Otherwise, use the `get_document_content` tool to retrieve the full content of the current document.
2. Analyze the content and identify the main ideas, key points, and important details.
3. Produce a Markdown bullet-point list that captures the essence of the content.
4. Each bullet point should be a single, concise sentence.
5. Aim for 5–10 bullet points for a typical document. Use fewer for short content and more for longer content.
6. Preserve any important technical terms, product names, or element names mentioned in the content.
7. Do **not** include XML markup in the output — return plain Markdown only.

## Output Format

Return the summary as a Markdown bullet-point list. Example:

```markdown
- The document explains how to configure the application preferences.
- Users can set the default language and output format.
- A new "Export" feature allows saving configurations to a JSON file.
- The preferences page is accessible from the **Options** menu.
```

## Response Requirements

- Keep each bullet point concise (one sentence).
- Order bullet points by importance or by the order they appear in the document.
- If the content is too short to warrant multiple bullet points, return a single summary sentence instead.
