<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="shortdesc">
            <sch:assert test=".[count(tokenize(normalize-space(text()), '\s+')) &lt;= 50]">
                Short descriptions should be concise. Rephrase it so that it contains a maximum of 50 words.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>