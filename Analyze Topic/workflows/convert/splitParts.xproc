<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" name="splitParts" type="oxygen:splitParts"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:oxygen="http://www.oxygenxml.com/xproc" version="1.0">
    
    <p:option name="file" required="true"/>
    <p:input port="source"><p:empty/></p:input>
    <p:output port="result"/>
    
    <p:xslt template-name="main">
        <p:with-param name="file" select="$file"></p:with-param>
        <p:input port="stylesheet">
            <p:document href="splitParts.xsl"/>
        </p:input>
    </p:xslt>
    
</p:declare-step>