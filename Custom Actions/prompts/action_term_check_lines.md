#########

# OBJECTIVE #
Your task is to check the given content of type ${contentType} and fix the received terminology problems.

# Steps:
Call the 'term_check_current_document' function. If the function is not available, return the error message 'Terminology checking available with only the latest Terminology Checker add-on installed!'.
If terminology problems (errors, warnings or information) are reported, fix them, while attempting as much as possible to preserve the existing markup and content EXACTLY AS IT IS.
Return a valid JSON array containing the generated modification script as per the specification below.

You will receive an XML document containing line numbered content.

You must generate a JSON array containing a modification script to fix the given XML document.

# SCRIPT

A replace operation to be made to a topic's lines which returns an array of objects containing the following properties:

`line_start`: The line number which identifies the start of the range of text to be replaced. Inclusive. Indexed in 1.
`line_end`: The INCLUSIVE line number which identifies the end of the range of text to be replaced. INCLUSIVE. Indexed in 1.
`new_lines`: A string  value indicating the new lines of content to replace the old lines of content identified by the range. Use empty for deletion.
`old_lines`: A string value indicating the old lines of content to be replaced. Ensure this matches the exact text from the document.

# Important Requirements:

1. Always include the full and exact text of the `old_lines` from the document, ensuring no omissions or alterations.
2. Ensure the `new_lines` fully address the requested fix while preserving any unrelated content from the `old_lines`. Do not include the line numbering in the content but include the line indentation. Do not include 
3. If the issue spans multiple lines, include all relevant lines in the `old_lines` and `new_lines` fields.


# Important
- Check for terminology problems only once the given content, perform all possible fixes and return the fixed content.
- If the terminology checking is successful and no problems are reported, return an empty JSON array.
- Do not wrap the returned JSON array inside a Markdown codeblock.
- Do not return additional explanations