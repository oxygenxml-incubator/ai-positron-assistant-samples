<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <sch:ns uri="http://www.oxygenxml.com/ai/function" prefix="ai"/>
    <sch:ns uri="java:ro.sync.ecss.dita.extensions.DITAXSLTExtensionFunctionUtil" prefix="ditaaccess"/>
    
    <sch:pattern>
        <sch:rule context="shortdesc">
            <sch:report test="count(tokenize(., '\s+')) > 55" role="warn" sqf:fix="rephrase">The
                short description must be concise. </sch:report>
            <sqf:fix id="rephrase">
                <sqf:description>
                    <sqf:title>Shorten description</sqf:title>
                </sqf:description>
                <sqf:replace match="text()"
                    select="ai:transform-content('Rephrase the following text in a single phrase strictly less than 40 words.', .)"
                />
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <!-- The text is not allowed directly in the section, it should be in a paragraph. Otherwise the output will be rendered with no space after the section -->
        <sch:rule context="*[contains(@class, ' topic/section ')]">
            <sch:report test="child::text()[string-length(normalize-space(.)) > 0]">The text in a section element should be in a paragraph.</sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="image[@href]">
            <sch:report test="not(alt)" role="war" sqf:fix="image-alt">The image does not have
                alternate text. </sch:report>
            <sqf:fix id="image-alt">
                <sqf:description>
                    <sqf:title>Add alternate text</sqf:title>
                </sqf:description>
                <sqf:add match="." position="last-child">
                    <alt>
                        <xsl:value-of select="
                            ai:transform-content(
                            'Create a short alternate text description for this image:',
                            concat('${attach(', resolve-uri(@href, base-uri()), ')}'))"/>
                    </alt>
                </sqf:add>
            </sqf:fix>
        </sch:rule>
        
        <sch:rule context="image[@keyref]">
            <sch:report test="not(alt)" role="war" sqf:fix="image-alt-keyref">The image does not have
                alternate text. </sch:report>
            <sqf:fix id="image-alt-keyref">
                <sqf:description>
                    <sqf:title>Add alternate text</sqf:title>
                </sqf:description>
                <sqf:add match="." position="last-child">
                    <alt>
                        <xsl:value-of select="
                            ai:transform-content(
                            'Create a short alternate text description for this image:',
                            concat('${attach(', ditaaccess:getKeyRefAbsoluteReference(@keyref, base-uri()), ')}'))"/>
                    </alt>
                </sqf:add>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
</sch:schema>
