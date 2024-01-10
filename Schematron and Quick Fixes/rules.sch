<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.oxygenxml.com/ai/function" prefix="ai"/>
    <sch:pattern>
        <sch:rule context="shortdesc">
            <sch:report 
                test="count(tokenize(.,'\s+')) > 55"
                role="warn"
                sqf:fix="rephrase">The short description must be concise.
            </sch:report>
            <sqf:fix id="rephrase">
                <sqf:description><sqf:title>Shorten description</sqf:title></sqf:description>
                <sqf:replace 
                    match="text()" 
                    select="ai:transform-content('Rephrase the following text in a single phrase strictly less than 40 words.', .)"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
</sch:schema>