<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/> 
    
    <!-- convenience variable -->
    <xsl:variable name="Interval" select="60"/>
    
    <xsl:variable name="avatarColl" select="collection('xml/book1/?select=*.xml')"/>
    
    <!-- structure -->  
    <xsl:template match="/">
        <svg width="100%" height="100%">
            <g transform="translate(60, 575)">
                <text x="375" y="-550" text-anchor="middle">Zuko's Appearances in Each Scene</text>
                <line x1="20" x2="20" y1="0" y2="-450" stroke="black" stroke-width="1"/>
                <line x1="20" x2="2000" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <text x="5" y="0" text-anchor="middle">0</text>
                <text x="5" y="-60" text-anchor="middle">10</text>
                <text x="5" y="-120" text-anchor="middle">20</text>
                <text x="5" y="-180" text-anchor="middle">30</text>
                <text x="5" y="-240" text-anchor="middle">40</text>
                <text x="5" y="-300" text-anchor="middle">50</text>
                <text x="5" y="-360" text-anchor="middle">60</text>
                <text x="5" y="-420" text-anchor="middle">70</text>
                <text x="500" y="30" text-anchor="middle"> Amount of Appearances </text>
                <xsl:apply-templates select="$avatarColl//scene"/>
            </g>
        </svg>
    </xsl:template>
    
    
    <xsl:template match="scene">
        <!-- x per chapter -->
        <xsl:variable name="xPos" select="position()*$Interval"/>
        <!-- amount of alice per chapter -->
        <xsl:variable name="yPos" select="count(.//speaker[@ref='Zuko']) * 6"/>
        <!-- x2 -->
        <xsl:variable name="xPos2" select="(position()+1)*$Interval"/>
        <!-- y2 -->
        <xsl:variable name="yPos2" select="(count(.//following-sibling::scene[1]//speaker[@ref='Zuko']))*6"/>
        <line x1="{$xPos}" x2="{$xPos2}" y1="-{$yPos}" y2="-{$yPos2}" stroke="black" stroke-width="5"/>
        <circle cx="{$xPos}" cy="-{$yPos}" r="5" fill="red"/>
        <text x="{$xPos - 3}" y="{-$yPos - 30}"><xsl:value-of select="count(.//speaker[@ref='Zuko'])"/></text>

        
    </xsl:template>
    
    
    
</xsl:stylesheet>