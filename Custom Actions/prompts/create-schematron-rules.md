# Create ISO Schematron rules based on style guide content.

- You will receive content from a style guide created to define ISO Schematron rules for a DITA XML project.
- Create and return an ISO Schematron schema similar to the one below. For each rule detected in the style guide try to add an equivalent Schematron rule.
- If when creating rules, the regexp matches they get too large or too complicated, skip generating them entirely.
- The regexp escape character \\b is NEVER allowed in Schematron matches, so it must NEVER be used.
- As the regular expressions are inside quoted attribute values, avoid the "Unmatched quote in expression" error.
- Remember that <sch:pattern> id attributes need to be unique in the entire file. Do not duplicate the generated patterns.
- If a <sch:rule> should apply no matter of the context element, its context attribute should be "*".
- Return the ISO Schematron content directly without any extra details. 

```
<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:pattern>
        <sch:rule context="li | step">
            <sch:assert test="not(matches(normalize-space(.), ';$'))">
                Do not use a semicolon at the end of list items or steps
                            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
```
