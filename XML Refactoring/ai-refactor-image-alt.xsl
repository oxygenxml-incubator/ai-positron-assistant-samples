<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ai ditaaccess" version="2.0"
    xmlns:ai="http://www.oxygenxml.com/ai/function"
    xmlns:ditaaccess="java:ro.sync.ecss.dita.extensions.DITAXSLTExtensionFunctionUtil">
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="image[@href][not(alt)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <alt>
                <xsl:value-of select="
                        ai:transform-content(
                        'Create a short alternate text description for this image:',
                        concat('$', '{attach(', resolve-uri(@href, base-uri()), ')}'))"/>
            </alt>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="image[@keyref][not(alt)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <alt>
                <xsl:value-of select="
                        ai:transform-content(
                        'Create a short alternate text description for this image:',
                        concat('$', '{attach(', ditaaccess:getKeyRefAbsoluteReference(@keyref, base-uri()), ')}'))"
                />
            </alt>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
