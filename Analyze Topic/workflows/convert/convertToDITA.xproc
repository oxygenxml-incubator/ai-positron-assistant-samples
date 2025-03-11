<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:oxygen="http://www.oxygenxml.com/xproc" type="oxygen:convertToDITA"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
    <p:import href="splitParts.xproc"/>
    <p:option name="file" required="true"/>

    <!-- output ports -->
    <p:output port="result" primary="true" sequence="true"/>
    <p:output port="_step1-afterSplit">
        <p:pipe step="splitParts" port="result"></p:pipe>
    </p:output>
    <p:output port="_step2-afterConvert">
        <p:pipe step="convertParts" port="result"></p:pipe>
    </p:output>
    <p:output port="_step3-afterCheck">
        <p:pipe step="checkConverted" port="result"></p:pipe>
    </p:output>
    <p:output port="_step4-afterMapGeneration" sequence="true">
        <p:pipe step="generateMap" port="result"></p:pipe>
    </p:output>
        
    <!-- split into parts -->
    <oxygen:splitParts name="splitParts">
        <p:with-option name="file" select="$file"/>
    </oxygen:splitParts>
    
    <!-- convert each part to the corresponding type -->
    <p:viewport match="//part" name="convertParts">
        <p:xslt>
            <p:input port="parameters"><p:empty/></p:input>
            <p:input port="stylesheet">
                <p:document href="convertPart.xsl"/>
            </p:input>
        </p:xslt>    
    </p:viewport>
    
    <!-- verify each part to be wellformed, ai-fix it if not and mark it wellformed -->
    <p:viewport match="//part" name="checkConverted">
        <p:xslt>
            <p:input port="parameters"><p:empty/></p:input>
            <p:input port="stylesheet">
                <p:document href="checkConverted.xsl"/>
            </p:input>
        </p:xslt>    
    </p:viewport>
    
    
    <!-- generate DITA map -->
    <p:xslt name="generateMap">
        <p:input port="parameters"><p:empty/></p:input>
        <p:input port="stylesheet">
            <p:document href="generateMap.xsl"/>
        </p:input>
    </p:xslt>
    
    
    <!--<p:for-each name="checkValid">
        <p:iteration-source select="//parsed/*"/>
        <p:validate-with-schematron assert-valid="false" name="v">
            <p:input port="schema">
                <p:document href="validate.sch"/>
            </p:input>
            <p:input port="parameters"><p:empty></p:empty></p:input>
        </p:validate-with-schematron>
        <p:identity>
            <p:input port="source">
                <p:pipe port="report" step="v"></p:pipe>
            </p:input>
        </p:identity>
    </p:for-each>
    
    
    <p:wrap-sequence name="validationRestults" wrapper="validationRestults"/>
    -->
    
    
    
</p:declare-step>