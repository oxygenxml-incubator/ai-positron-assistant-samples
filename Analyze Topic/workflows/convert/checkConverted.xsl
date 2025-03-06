<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ai" version="3.1"
    xmlns:ai="http://www.oxygenxml.com/ai/function">   
    
    <xsl:template match="/*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>            
            <xsl:variable name="content" select="replace(., '^\s+|\s+$', '')"/>
            <xsl:try>
                <xsl:variable name="parsed" select="parse-xml($content)"/>
                <xsl:attribute name="wellformed" select="if ($parsed) then 'true' else 'false'"/>
                <xsl:value-of select="$content"/>
                <xsl:catch>
                    <xsl:variable name="fixed" select="ai:transform-content(
                        'Make this well-formed XML, in particualt make sure &amp; is double escaped as &amp;amp;. Return only the updated content without explanations.', $content)"/>
                    <xsl:variable name="unwrapCode" select="replace(if (starts-with($fixed, '```')) then substring($fixed, 7, string-length($fixed)-10) else $fixed, '^\s+|\s+$', '')"/>
                    <xsl:try>
                        <xsl:variable name="parsed2" select="parse-xml($unwrapCode)"/>
                        <xsl:attribute name="wellformed" select="if ($parsed2) then 'true' else 'false'"/>
                        <xsl:attribute name="aiFixed" select="'true'"/>
                        <xsl:value-of select="$unwrapCode"/>
                        <xsl:catch>
                            <xsl:attribute name="wellformed" select="false"/>
                            <content><xsl:value-of select="$content"/></content>
                            <afterFixAttempt><xsl:value-of select="$unwrapCode"/></afterFixAttempt>
                        </xsl:catch>
                    </xsl:try>
                </xsl:catch>
            </xsl:try>   
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>