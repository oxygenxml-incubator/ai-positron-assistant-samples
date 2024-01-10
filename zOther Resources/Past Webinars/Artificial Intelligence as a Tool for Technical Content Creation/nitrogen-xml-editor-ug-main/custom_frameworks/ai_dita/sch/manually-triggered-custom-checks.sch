<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://www.w3.org/1999/xhtml">
    <sch:ns uri="http://www.oxygenxml.com/ai/function" prefix="ai"/>
        
    <!--<sch:pattern>
        <sch:rule context="shortdesc">
            <sch:report role="warn" test="ai:verify-content('Does the following text use passive voice? Answer strictly with true or false, nothing more, nothing less.', .)"
                sqf:fix="rephrase">Passive voice usage detected. Waiting for orders...</sch:report>
            <sqf:fix id="rephrase">
                <sqf:description><sqf:title>Rewrite the text to use active voice.</sqf:title></sqf:description>
                <sqf:replace match="text()" select="ai:transform-content('Rewrite the text to use active voice:', .)"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>-->
    
</sch:schema>