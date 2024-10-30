<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:functx="http://www.functx.com" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="3.0">

    <xsl:template match="phrases">
        <phrases>
            <xsl:apply-templates select="phrase"/>
        </phrases>
    </xsl:template>

    <xsl:template match="phrase">
        <xsl:variable name="escaped-text" select="functx:escape-for-regex(.)"/>
        <phrase status="{if (. = $escaped-text) then 'changed' else 'same'}">
            <xsl:value-of select="functx:escape-for-regex(.)"/>
        </phrase>
    </xsl:template>

    <xsl:function name="functx:escape-for-regex" as="xs:string">
        <xsl:param name="arg" as="xs:string?"/>

        <xsl:sequence select="
                replace($arg,
                '(\.|\[|\]|\\|\||\-|\^|\$|\?|\*|\+|\{|\}|\(|\))', '\\$1')
                "/>
    </xsl:function>

</xsl:stylesheet>
