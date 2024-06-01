<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ai" version="2.0"
    xmlns:ai="http://www.oxygenxml.com/ai/function">
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template
        match="*[local-name() = ('topic', 'concept', 'task', 'reference')][not(shortdesc)]/title">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
        <!-- And now generate shortdesc using AI -->
        <xsl:text>
    </xsl:text>
        <shortdesc>
            <xsl:value-of select="
                    ai:transform-content('You are a technical documentation writer. Generate a short description in less than 30 words for this content:',
                    string-join(parent::*//text(), ''))"/>
        </shortdesc>
    </xsl:template>
</xsl:stylesheet>
