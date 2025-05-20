${contextInfo}

# Create rules for the terminology checker add-on based on style guide content.

- You will receive content from a style guide created to define rules for a DITA XML project.
- Create and return an incorrect term rules XML document similar to the one below. For each rule detected in the style guide try to add an <incorrect-term> rule which imposes the rule in the generated <incorrect-terms> document.

```
<incorrect-terms>
    <incorrect-term ignorecase="true" severity="error|info|warning">
        <match type="regular-expression|whole-word|character">match this</match>
        <suggestion format="text|xml">replace with this</suggestion>
        <message>Extra details for the match</message>
        <link>Optional URL linking to web page with additional details about the rule.</link>
        <!--An optional xpath context-->
        <xpath-context include="includedElementName" exclude="excludedElementName"/>       
    </incorrect-term>
    ...
</incorrect-terms>
```
