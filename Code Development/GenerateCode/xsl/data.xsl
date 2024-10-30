<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:func="urn:my-functions">

    <!-- Template that generates the city in a div with fisrt leter capitalized -->
    
    <!-- Function that calculates the longest name -->

    <!-- Converts the first character of a string to uppercase. Accepts a string parameter and returns
        the string with its initial character capitalized. -->
    <xsl:function name="func:upper-case-first" as="xs:string">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="first" select="substring($input, 1, 1)"/>
        <xsl:variable name="rest" select="substring($input, 2)"/>
        <xsl:value-of select="concat(upper-case($first), $rest)"/>
    </xsl:function>
    
    <!-- Calculates the length of a given string. Returns the length as an integer. -->
    <xsl:function name="func:calculate-length" as="xs:integer">
        <xsl:param name="input" as="xs:string"/>
        <xsl:sequence select="string-length($input)"/>
    </xsl:function>
    
    <!-- Transforms XML data into an HTML document with a title "Generated HTML". It applies templates
        to each "item" element within the "data" root element, displaying them under a "Data Overview"
        heading. -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Generated HTML</title>
            </head>
            <body>
                <h1>Data Overview</h1>
                <xsl:apply-templates select="data/item"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Transforms "item" elements into a structured HTML div with class "item". Displays the item's
        name in uppercase, its description, and the description's length, and processes any "details"
        elements. -->
    <xsl:template match="item">
        <div class="item">
            <h2><xsl:value-of select="func:upper-case-first(name)"/></h2>
            <p>Description: <xsl:value-of select="description"/></p>
            <p>Length: <xsl:value-of select="func:calculate-length(description)"/></p>
            <xsl:apply-templates select="details"/>
        </div>
    </xsl:template>
    
    <!-- Transforms "details" elements into an unordered list. Applies templates to each "detail" child
        element to generate list items. -->
    <xsl:template match="details">
        <ul>
            <xsl:apply-templates select="detail"/>
        </ul>
    </xsl:template>
    
    <!-- Transforms each "detail" element into a list item. Extracts and displays the text content of
        the "detail" element within an HTML list item. -->
    <xsl:template match="detail">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>