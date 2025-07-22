<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern id="p-keyword-in-keywords">
        <sch:rule context="p/keyword">
            <sch:let name="keywords" value="ancestor::concept/prolog/metadata/keywords/keyword"/>
            <sch:assert test=". = $keywords" role="info">
                A keyword referenced in the content should be added to the "keywords" list in the prolog for improved searchability.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>