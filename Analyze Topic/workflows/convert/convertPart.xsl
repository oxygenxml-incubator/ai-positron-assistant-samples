<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ai" version="3.1"
    xmlns:ai="http://www.oxygenxml.com/ai/function">   
    
    
    <xsl:template match="/part">
        <xsl:variable name="actionId" select="concat('com.oxygenxml.ai.positron.action.dita.convert.to.', @type)"/>
        <xsl:variable name="converted" select="ai:invoke-action($actionId, '', .)"/>
        <!--<xsl:variable name="unwrapCode" select="if (starts-with($converted, '```')) then substring($converted, 7, string-length($converted)-10) else $converted"/>-->
        <xsl:variable name="unwrapCode" select="
            replace(
                if (starts-with($converted, '```xml')) then substring($converted, 7, string-length($converted)-10) else
                (if (starts-with($converted, '&lt;think&gt;')) then substring-after($converted, '&lt;/think&gt;') else $converted),
                '^\s+|\s+$', '' 
             )"/>
        <part>
            <xsl:copy-of select="@*"/>
            <xsl:text>                
    </xsl:text>
            <converted action="{$actionId}" filename="{@filename}{if (ends-with(@filename, '.dita')) then '' else '.dita'}" type="{@type}">
                <xsl:value-of select="$unwrapCode"/>
            </converted>
            <xsl:text>                
    </xsl:text>
            <original><xsl:value-of select="."></xsl:value-of></original>
            <xsl:text>                
  </xsl:text>
        </part>
    </xsl:template>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>