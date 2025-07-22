<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <sch:ns uri="http://www.oxygenxml.com/ai/function" prefix="ai"/>
    <sch:ns uri="java:ro.sync.ecss.dita.extensions.DITAXSLTExtensionFunctionUtil" prefix="ditaaccess"/>
    
    <sch:pattern>
        <!-- The text is not allowed directly in the section, it should be in a paragraph. Otherwise the output will be rendered with no space after the section -->
        <sch:rule context="*[contains(@class, ' topic/section ')]">
            <sch:report test="child::text()[string-length(normalize-space(.)) > 0]">The text in a section element should be in a paragraph.</sch:report>
        </sch:rule>
    </sch:pattern>
    
    <!-- Topic ID must be equal to file name -->
    <sch:pattern>
        <sch:rule context="/*[1][contains(@class, ' topic/topic ')]">
            <sch:let name="reqId" value="replace(tokenize(document-uri(/), '/')[last()], '\.dita', '')"/>
            <sch:assert test="@id = $reqId" sqf:fix="setId">
                Topic ID must be equal to file name.
            </sch:assert>
            <sqf:fix id="setId">
                <sqf:description>
                    <sqf:title>Set "<sch:value-of select="$reqId"/>" as a topic ID</sqf:title>
                    <sqf:p>The topic ID must be equal to the file name.</sqf:p>
                </sqf:description>
                <sqf:add node-type="attribute" target="id" select="$reqId"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <!-- Report if link text same as @href value -->
    <sch:pattern>
        <sch:rule context="*[contains(@class, ' topic/xref ') or contains(@class, ' topic/link ')]">
            <sch:report test="@scope='external' and @href=text()" sqf:fix="removeText">
                Link text is same as @href attribute value. Please remove.
            </sch:report>
            <sqf:fix id="removeText">
                <sqf:description>
                    <sqf:title>Remove redundant link text, text is same as @href value.</sqf:title>
                </sqf:description>
                <sqf:delete match="text()"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>
