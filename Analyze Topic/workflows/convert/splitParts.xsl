<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ai" version="3.1"
    xmlns:ai="http://www.oxygenxml.com/ai/function">   
    
    <xsl:param name="file"></xsl:param>
    
    <xsl:template name="main">
        <xsl:variable name="content">
            <xsl:value-of select="unparsed-text($file)"/>            
        </xsl:variable>
        <xsl:variable name="split" select="ai:invoke-action('com.oxygenxml.ai.positron.action.dita.splitIntoTopicParts', '', $content)"/>
        
        <xsl:variable name="unwrapCode" select="
            replace(
                if (starts-with($split, '```xml')) then substring($split, 7, string-length($split)-10) else
                (if (starts-with($split, '&lt;think&gt;')) then substring-after($split, '&lt;/think&gt;') else $split),
                '^\s+|\s+$', '' 
             )"/>
                
        <xsl:try>
            <xsl:copy-of select="parse-xml($unwrapCode)"/>
            <xsl:catch>
                <xsl:variable name="fixed" select="ai:transform-content(
                    'Make this well-formed XML, in particular make sure &amp; is double escaped as &amp;amp;. Return only the updated content without explanations.', $unwrapCode)"/>
                <xsl:variable name="unwrapCode2" select="normalize-space(if (starts-with($fixed, '```')) then substring($fixed, 7, string-length($fixed)-10) else $fixed)"/>
                <xsl:try>
                    <xsl:copy-of select="parse-xml($unwrapCode2)"/>
                    <xsl:catch>
                        <parseFailed>
                            <content><xsl:value-of select="$unwrapCode"/></content>
                            <afterFixingAttempt><xsl:value-of select="$unwrapCode2"/></afterFixingAttempt>
                        </parseFailed>
                    </xsl:catch>
                </xsl:try>
            </xsl:catch>
        </xsl:try>
    </xsl:template>
    
    
</xsl:stylesheet>