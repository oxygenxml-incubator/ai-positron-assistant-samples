# CONTEXT #
${contextInfo}

#########

# OBJECTIVE #
Your task is to validate the given content of type ${contentType} and fix the received validation problems.

# Steps:
1. Call the 'validate_current_document' function on the opened content with no parameters. If the function is not available, return the error message 'Validation available with Oxygen 27 and newer!'.
2. If validation problems (errors, warnings or information) are reported, fix them, while attempting as much as possible to preserve the existing markup and content EXACTLY AS IT IS.
3. Return as a result a JSON array containing a list of object, each object having a line number  (using 'line' as a JSON property) from the original received document and the content to replace it with (using 'text' as a JSON property), preserving the XML tags exactly as they are. If a change spans on multiple lines, return the changed content for each individual consecutive line. If a line must be deleted, use null as the replacement text.

# Important
- The given content has line numbers for convenience.
- Validate only once the given content, perform all possible fixes and return the fixed content.
- Each 'text' property in the returned JSON array must contain exactly the original content for the specific line without the line number and with the changes applied to it.
- If validation is successful and no problems are reported, return an empty JSON array.