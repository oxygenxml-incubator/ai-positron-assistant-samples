<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
  <sch:pattern>
    <sch:rule context="concept/title">
      <sch:report test="not(node())">The title must not be empty and should briefly summarize the content of the document.</sch:report>
    </sch:rule>
  </sch:pattern>
</sch:schema>