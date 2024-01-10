<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" queryBinding="xslt2"
    xmlns="http://www.w3.org/1999/xhtml">
    <sch:ns uri="http://www.oxygenxml.com/ai/function" prefix="ai"/>
    
    <!-- Missing table cells validation -->
    <sch:pattern>
        <sch:rule context="table[@id='success_criteria_level_1']">
            <sch:let name="minColumsNo" value="min(.//row/count(entry))"/>
            <sch:let name="reqColumsNo" value="max(.//row/count(entry))"/>
            <sch:assert test="$minColumsNo >= $reqColumsNo" id="tableCellsID">Some table cells are missing. The
                number of cells for each row must be <sch:value-of select="$reqColumsNo"/>. Add the necesary cells.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <!-- Long short description -->
    <sch:pattern>
        <sch:rule context="shortdesc">
            <sch:report 
                test="count(tokenize(.,'\s+')) > 55"
                role="warn"
                sqf:fix="rephrase">This short description is not short anymore.
            </sch:report>
            <sqf:fix id="rephrase">
                <sqf:description><sqf:title>Make short description short again</sqf:title></sqf:description>
                <sqf:replace 
                    match="text()" 
                    select="ai:transform-content('Rephrase the following text in a single phrase strictly less than 40 words.', .)"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>
