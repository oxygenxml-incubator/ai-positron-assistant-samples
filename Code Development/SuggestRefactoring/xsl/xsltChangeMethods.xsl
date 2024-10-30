<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Root template that matches the document root -->
    <xsl:template match="/">
        <report>
            <xsl:apply-templates select="data/item"/>
        </report>
    </xsl:template>
    
    <!-- Template for transforming item elements -->
    <xsl:template match="item">
        <itemDetails>
            <itemId>
                <xsl:value-of select="@id"/>
            </itemId>
            <itemType>
                <xsl:value-of select="@type"/>
            </itemType>
            
            <!-- Incorrect usage of xsl:choose instead of xsl:if -->
            <status>
                <xsl:choose>
                    <xsl:when test="@status = 'active'">
                        Active
                    </xsl:when>
                    <xsl:when test="@status = 'inactive'">
                        Inactive
                    </xsl:when>
                    <xsl:otherwise>
                        Unknown
                    </xsl:otherwise>
                </xsl:choose>
            </status>
            
            <!-- Correct usage of xsl:if for a single condition -->
            <xsl:if test="@type = 'A'">
                <specialNote>This is a special type A item.</specialNote>
            </xsl:if>
            
            <!-- Incorrect usage of xsl:if for multiple conditions -->
            <xsl:if test="@value &gt; 100">
                <note>Value is high!</note>
            </xsl:if>
            <xsl:if test="@value &gt; 50">
                <note>Value is medium!</note>
            </xsl:if>
            <xsl:if test="@value &lt;= 50">
                <note>Value is low!</note>
            </xsl:if>
            
            <!-- Example of incorrect xsl:choose usage for value range -->
            <xsl:choose>
                <xsl:when test="@value &gt; 100">
                    <valueCategory>High</valueCategory>
                </xsl:when>
                <xsl:when test="@value &gt;= 50">
                    <valueCategory>Medium</valueCategory>
                </xsl:when>
                <xsl:otherwise>
                    <valueCategory>Low</valueCategory>
                </xsl:otherwise>
            </xsl:choose>
            
            <!-- Processing sub-items -->
            <subItems>
                <xsl:for-each select="subItem">
                    <subItemDetails>
                        <subItemId>
                            <xsl:value-of select="@id"/>
                        </subItemId>
                        <subItemValue>
                            <xsl:value-of select="."/>
                        </subItemValue>
                        <xsl:if test=". &gt; 10">
                            <status>High</status>
                        </xsl:if>
                        <xsl:if test=". &gt;= 5">
                            <status>Medium</status>
                        </xsl:if>
                        <xsl:if test=". &lt; 5">
                            <status>Low</status>
                        </xsl:if>
                    </subItemDetails>
                </xsl:for-each>
            </subItems>
        </itemDetails>
    </xsl:template>
    
    <!-- Transforms "subItem" elements into "subItemDetails" elements. Extracts the ID and value, and
        categorizes the value as "High," "Medium," or "Low" based on its numeric value. -->
    <xsl:template match="subItem">
        <subItemDetails>
            <subItemId>
                <xsl:value-of select="@id"/>
            </subItemId>
            <subItemValue>
                <xsl:value-of select="."/>
            </subItemValue>
            <!-- Use xsl:choose for better readability and efficiency -->
            <xsl:choose>
                <xsl:when test=". &gt; 10">
                    <status>High</status>
                </xsl:when>
                <xsl:when test=". &gt;= 5">
                    <status>Medium</status>
                </xsl:when>
                <xsl:otherwise>
                    <status>Low</status>
                </xsl:otherwise>
            </xsl:choose>
        </subItemDetails>
    </xsl:template>
    
    <!-- Evaluates the attribute "value" and categorizes it as high, medium, or low. Outputs a
        corresponding note based on the value's range. -->
    <xsl:template name="processValue">
        <xsl:choose>
            <xsl:when test="@value &gt; 100">
                <note>Value is high!</note>
            </xsl:when>
            <xsl:when test="@value &gt; 50">
                <note>Value is medium!</note>
            </xsl:when>
            <xsl:otherwise>
                <note>Value is low!</note>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Transforms each "child" element within a "parent" element into a "processedChild" element.
        Extracts and includes the text content of each "child" element in the new "processedChild"
        element. -->
    <xsl:template match="parent">
        <xsl:for-each select="child">
            <processedChild>
                <xsl:value-of select="."/>
            </processedChild>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>