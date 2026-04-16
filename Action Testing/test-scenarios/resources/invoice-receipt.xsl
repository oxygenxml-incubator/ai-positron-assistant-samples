<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="true"/>
    <xsl:template match="invoice">
        <invoiceReport>
            <customerInfo>
                <customerName>
                    <xsl:text>Customer:</xsl:text>
                    <xsl:value-of select="customer/name"/>
                </customerName>
                <customerID>
                    <xsl:value-of select="customer/id"/>
                </customerID>
            </customerInfo>
            <details>
                <totalAmount>
                    <xsl:value-of select="total"/>
                </totalAmount>
            </details>
            <items>
                <xsl:for-each select="items/item">
                    <item>
                        <name><xsl:value-of select="name"/></name>
                        <price><xsl:value-of select="price"/></price>
                    </item>
                </xsl:for-each>
            </items>
        </invoiceReport>
    </xsl:template>
    
    <xsl:template match="receipt">
        <receiptReport>
            <customerInfo>
                <customerName>
                    <xsl:value-of select="customer/name"/>
                </customerName>
                <customerID>
                    <xsl:value-of select="customer/id"/>
                </customerID>
            </customerInfo>
            <details>
                <totalAmount>
                    <xsl:value-of select="total"/>
                </totalAmount>
            </details>
            <items>
                <xsl:for-each select="items/item">
                    <item>
                        <name><xsl:value-of select="name"/></name>
                        <price><xsl:value-of select="price"/></price>
                    </item>
                </xsl:for-each>
            </items>
            
        </receiptReport>
    </xsl:template>
</xsl:stylesheet>
