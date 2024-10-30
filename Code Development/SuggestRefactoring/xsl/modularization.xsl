<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Main template matching the root node -->
    <xsl:template match="/">
        <root>
            <summary>
                <!-- Display the count of items processed -->
                <xsl:value-of select="concat('Items Processed: ', count(//item))"/>
            </summary>
            <items>
                <!-- Iterate over each item -->
                <xsl:for-each select="items/item">
                    <itemDetails>
                        <xsl:choose>
                            <!-- Handle Type A items -->
                            <xsl:when test="@type='A'">
                                <typeDescription>Type A Item</typeDescription>
                                <xsl:choose>
                                    <!-- Check if value is greater than 10 -->
                                    <xsl:when test="data/@value &gt; 10">
                                        <value>
                                            <xsl:value-of select="concat('High-', data/@value)"/>
                                        </value>
                                        <nested>
                                            <!-- Iterate over subdata for Type A -->
                                            <xsl:for-each select="data/subdata">
                                                <subItem>
                                                    <xsl:choose>
                                                        <!-- Check subtype for subdata -->
                                                        <xsl:when test="@subtype='x'">
                                                            <description>Sub-X Type</description>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <description>Unknown Subtype</description>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    <subValue>
                                                        <xsl:value-of select="value"/>
                                                    </subValue>
                                                </subItem>
                                            </xsl:for-each>
                                        </nested>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <value>Low Value</value>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <!-- Handle Type B items -->
                            <xsl:when test="@type='B'">
                                <typeDescription>Type B Item</typeDescription>
                                <xsl:choose>
                                    <!-- Check if value is less than 5 -->
                                    <xsl:when test="data/@value &lt; 5">
                                        <value>
                                            <xsl:value-of select="concat('Low-', data/@value)"/>
                                        </value>
                                        <!-- Iterate over subdata for Type B -->
                                        <xsl:for-each select="data/subdata">
                                            <subItem>
                                                <xsl:choose>
                                                    <!-- Check subtype for subdata -->
                                                    <xsl:when test="@subtype='y'">
                                                        <description>Sub-Y Type</description>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <description>Unknown Subtype</description>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </subItem>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <value>Higher Value</value>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </itemDetails>
                </xsl:for-each>
            </items>
        </root>
    </xsl:template>
</xsl:stylesheet>
