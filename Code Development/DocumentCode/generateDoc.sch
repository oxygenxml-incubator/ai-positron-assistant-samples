<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <sch:ns uri="http://www.oxygenxml.com/ai/function" prefix="ai"/>
    <sch:ns uri="http://www.w3.org/2005/xpath-functions" prefix="fn"/>
    <sch:pattern>
        <sch:rule context="xsl:template | xsl:function">
            <sch:assert test="preceding-sibling::node()[not(self::text())][1][self::comment()]" sqf:fix="generateDoc" role="info">
                The <sch:name/> does not have a documentation</sch:assert>
            <sqf:fix id="generateDoc">
                <sqf:description>
                    <sqf:title>Generate documentation using AI</sqf:title>
                </sqf:description>
                <sqf:add position="before">
                    <xsl:comment select="ai:transform-content(
                        'Act as an XSLT developer. Describe the following XSLT code.', fn:serialize(.))"/>
                    <xsl:text>
                    </xsl:text>
                </sqf:add>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
</sch:schema>