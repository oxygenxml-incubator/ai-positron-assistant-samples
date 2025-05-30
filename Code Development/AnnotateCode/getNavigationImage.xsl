<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template name="getNavigationImage">
        <xsl:value-of select="$oXygenProfilerImages"/>
        <xsl:text>/</xsl:text>
        <xsl:choose>
            <xsl:when test="content/*[not(self::snipped)]">
                <xsl:choose>
                    <xsl:when test="following-sibling::*[name()=name(current())]"><xsl:value-of select="$imgMenuTreeMinus"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$imgMenuCornerMinus"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="content/snipped">
                <xsl:choose>
                    <xsl:when test="following-sibling::*[name()=name(current())]"><xsl:value-of select="$imgMenuTreePlus"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$imgMenuCornerPlus"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="following-sibling::*[name()=name(current())]"><xsl:value-of select="$imgMenuTree"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$imgMenuCorner"/></xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>