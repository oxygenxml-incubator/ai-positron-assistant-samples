<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Define an output format for the transformation -->
    <xsl:output method="html" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/library">
        <html>
            <head>
                <title>Library Collection</title>
            </head>
            <body>
                <h1>Library Collection</h1>
                <!-- Call the reusable template for displaying the list of books -->
                <xsl:call-template name="book-list"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template to display the list of books -->
    <xsl:template name="book-list">
        <ul>
            <!-- Apply template to each book element -->
            <xsl:for-each select="book">
                <li>
                    <xsl:value-of select="title"/> by <xsl:value-of select="author"/> (<xsl:value-of
                        select="year"/>) - price: <xsl:value-of select="price"/> </li>
            </xsl:for-each>
        </ul>
        <xsl:variable name="totalPrice" select="sum(book/price)"/>
        <xsl:variable name="bookCount" select="count(book)"/>
        <xsl:variable name="averagePrice" select="$totalPrice div $bookCount"/>
        <p>Average price: <xsl:value-of select="$averagePrice"/></p>

    </xsl:template>

    <!-- Template to display individual book details -->
    <xsl:template name="book-details">
        <xsl:value-of select="title"/> by <xsl:value-of select="author"/> (<xsl:value-of
            select="year"/>) </xsl:template>

    <!-- Calculates and displays the average price of books. Computes the average by dividing the total
        price by the number of books. -->
    <xsl:template name="average-price">
        <xsl:variable name="totalPrice" select="sum(book/price)"/>
        <xsl:variable name="bookCount" select="count(book)"/>
        <xsl:variable name="averagePrice" select="$totalPrice div $bookCount"/>
        <p>Average price: <xsl:value-of select="$averagePrice"/></p>
    </xsl:template>


</xsl:stylesheet>
