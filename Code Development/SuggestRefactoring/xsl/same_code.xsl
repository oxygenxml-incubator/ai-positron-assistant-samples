<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Template 1 -->
    <xsl:template match="item[@type='type1']">
        <output>
            <xsl:choose>
                <xsl:when test="@type = 'type1'">
                    <description>Processing type1</description>
                    <result>
                        <xsl:value-of select="data"/>
                    </result>
                </xsl:when>
                <xsl:otherwise>
                    <description>Unknown type</description>
                </xsl:otherwise>
            </xsl:choose>
        </output>
    </xsl:template>
    
    <!-- Template 2 -->
    <xsl:template match="item[@type='type2']">
        <output>
            <xsl:choose>
                <xsl:when test="@type = 'type2'">
                    <description>Processing type2</description>
                    <result>
                        <xsl:value-of select="data"/>
                    </result>
                </xsl:when>
                <xsl:otherwise>
                    <description>Unknown type</description>
                </xsl:otherwise>
            </xsl:choose>
        </output>
    </xsl:template>
    
    <!-- Template 3 -->
    <xsl:template match="item[@type='type3']">
        <output>
            <xsl:choose>
                <xsl:when test="@type = 'type3'">
                    <description>Processing type3</description>
                    <result>
                        <xsl:value-of select="data"/>
                    </result>
                </xsl:when>
                <xsl:otherwise>
                    <description>Unknown type</description>
                </xsl:otherwise>
            </xsl:choose>
        </output>
    </xsl:template>
    
    <!-- Template 4 -->
    <xsl:template match="item[@type='type4']">
        <output>
            <xsl:choose>
                <xsl:when test="@type = 'type4'">
                    <description>Processing type4</description>
                    <result>
                        <xsl:value-of select="data"/>
                    </result>
                </xsl:when>
                <xsl:otherwise>
                    <description>Unknown type</description>
                </xsl:otherwise>
            </xsl:choose>
        </output>
    </xsl:template>
    
    <!-- Template 5 -->
    <xsl:template match="item[@type='type5']">
        <output>
            <xsl:choose>
                <xsl:when test="@type = 'type5'">
                    <description>Processing type5</description>
                    <result>
                        <xsl:value-of select="data"/>
                    </result>
                </xsl:when>
                <xsl:otherwise>
                    <description>Unknown type</description>
                </xsl:otherwise>
            </xsl:choose>
        </output>
    </xsl:template>
    
</xsl:stylesheet>
