<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2005/xpath-functions"
    xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
    xmlns:mf="http://example.com/mf" xmlns:http="http://expath.org/ns/http-client"
    exclude-result-prefixes="#all">

    <xsl:template name="xsl:initial-template">
        <xsl:variable name="req">
            <http:request href="http://polvo.ca" method="get">
                <http:body media-type="text/html"/>
            </http:request>
        </xsl:variable>
        <xsl:call-template name="start">
            <xsl:with-param name="req" select="$req"/>
        </xsl:call-template>
        <xsl:value-of select="$req"/>
    </xsl:template>

    <xsl:template name="start">
        <xsl:param name="req"/>
        <xsl:value-of select="$req"/>
    </xsl:template>

</xsl:stylesheet>
