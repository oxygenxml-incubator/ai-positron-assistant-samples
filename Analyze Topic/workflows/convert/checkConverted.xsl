<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ai" version="3.1"
    xmlns:ai="http://www.oxygenxml.com/ai/function">   
    
    
    <xsl:template match="/part">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="original">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="converted">
        <xsl:variable name="content" select="replace(., '^\s+|\s+$', '')"/>
        <xsl:try>
            <xsl:variable name="parsed" select="parse-xml($content)"/>
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:attribute name="wellformed" select="if ($parsed) then 'true' else 'false'"/>
                <xsl:value-of select="$content"/> 
            </xsl:copy>
            <parsed>
                <xsl:copy-of select="@*"/>
                <xsl:copy-of select="$parsed"/>
            </parsed>
            
            <xsl:catch>
                <xsl:variable name="fixed" select="ai:transform-content(
                    'Make this well-formed XML, in particualt make sure &amp; is double escaped as &amp;amp;. Return only the updated content without explanations.', $content)"/>
                <!--<xsl:variable name="unwrapCode" select="replace(if (starts-with($fixed, '```')) then substring($fixed, 7, string-length($fixed)-10) else $fixed, '^\s+|\s+$', '')"/>-->
                <xsl:variable name="unwrapCode" select="replace($fixed, '^```.*\s+|\s+```$', '')"/>
                <xsl:try>
                    <xsl:variable name="parsed2" select="parse-xml($unwrapCode)"/>
                    <xsl:copy>
                        <xsl:copy-of select="@*"/>
                        <xsl:attribute name="wellformed" select="if ($parsed2) then 'true' else 'false'"/>
                        <xsl:attribute name="aiFixed" select="'true'"/>
                        <xsl:value-of select="$unwrapCode"/>
                    </xsl:copy>
                    <parsed>
                        <xsl:copy-of select="@*"/>
                        <xsl:copy-of select="$parsed2"/>
                    </parsed>
                    <xsl:catch>
                        <xsl:copy>
                            <xsl:copy-of select="@*"/>
                            <xsl:attribute name="wellformed" select="false"/>
                            <xsl:value-of select="$content"/>    
                        </xsl:copy>
                        <convertedFixAttempt>
                            <xsl:copy-of select="@*"/>
                            <xsl:attribute name="wellformed" select="false"/>
                            <xsl:value-of select="$unwrapCode"/>
                        </convertedFixAttempt>
                    </xsl:catch>
                </xsl:try>
            </xsl:catch>
        </xsl:try>  
        
        
        
        
    </xsl:template>
    
</xsl:stylesheet>