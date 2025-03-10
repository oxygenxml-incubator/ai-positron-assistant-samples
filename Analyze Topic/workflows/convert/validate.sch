<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:pattern>
        <sch:rule context="/*">
            <sch:assert test="@domains">The root of a DITA topic should have a domains attribute!</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>