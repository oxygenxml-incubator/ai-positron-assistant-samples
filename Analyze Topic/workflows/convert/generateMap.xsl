<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml"/>
    
    
    <xsl:template match="/content">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="*|node()"/>
            <part>
                <converted title="{@mapTitle}" filename="{@mapFilename}" wellformed="'true'">
                    <xsl:text><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "map.dtd">
<map>
  <title>]]></xsl:text>
                    <xsl:value-of select="@mapTitle"/>
                    <xsl:text><![CDATA[</title>
  ]]></xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text><![CDATA[
</map>]]></xsl:text>
                </converted>
                <parsed filename="{@mapFilename}" type="map">
                    <map xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" ditaarch:DITAArchVersion="1.3" domains="(map mapgroup-d)                            (topic abbrev-d)                            (topic delay-d)                            a(props deliveryTarget)                            (map ditavalref-d)                            (map glossref-d)                            (topic hazard-d)                            (topic hi-d)                            (topic indexing-d)                            (topic markup-d)                            (topic pr-d)                            (topic relmgmt-d)                            (topic sw-d)                            (topic ui-d)                            (topic ut-d)                            (topic markup-d xml-d)   " class="- map/map ">
                        <title class="- topic/title "><xsl:value-of select="@mapTitle"/></title>
                        <xsl:apply-templates mode="parsed"/>
                    </map>
                </parsed>
            </part>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="converted">
        <xsl:text><![CDATA[
  <topicref href="]]></xsl:text>
        <xsl:value-of select="@filename"/>
        <xsl:text><![CDATA["/>]]></xsl:text>        
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="text()"/>
    
    
    <xsl:template match="converted" mode="parsed">
        <topicref href="{@filename}" class="- map/topicref "/>
    </xsl:template>
    
    <xsl:template match="*" mode="parsed">
        <xsl:apply-templates mode="parsed"/>
    </xsl:template>
    <xsl:template match="text()" mode="parsed"/>
    
</xsl:stylesheet>