<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:oxygen="http://www.oxygenxml.com/xproc" type="oxygen:convertMad2DITAtopics"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
    <p:import href="convertToDITA.xproc"/>
    
    <p:option name="file" required="true"/>

    <!-- output ports -->
    <p:output port="result" sequence="true" primary="true"/>
        
    
    <!-- convert to DITA -->
    <oxygen:convertToDITA name="convert">
        <p:with-option name="file" select="$file"/>
    </oxygen:convertToDITA>

    <p:for-each name="store">
        <p:iteration-source select="//converted"></p:iteration-source>
        <p:identity name="init"/>
        
        <p:store encoding="utf-8" method="text">
            <p:with-option name="href" xml:base="output/" select="/*/@filename"/>
        </p:store>
        <p:identity>
            <p:input port="source"><p:pipe port="result" step="init"></p:pipe></p:input>
        </p:identity>
    </p:for-each>

    
    
</p:declare-step>