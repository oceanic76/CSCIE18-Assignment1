<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
    <xsl:param name="description" select="'yes'"/>
    <xsl:template match="/">
        <xsl:variable name="title" select="xbel/title"/>
        <html>
            <head>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
            </head>
            <body>
                <h1/>
                <h1>
                    <xsl:value-of select="$title"/>
                </h1>
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </body>
        </html>
    </xsl:template><!-- <folder> becomes <li> -->
    <xsl:template match="folder">
        <li>
            <xsl:value-of select="title"/>
            <xsl:if test="folder">
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </xsl:if>
            <ul>
                <xsl:apply-templates select="bookmark"/>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="bookmark">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="@href"/>
                </xsl:attribute>
                <xsl:value-of select="title"/>
            </a>
            <br/>
            <xsl:if test="not($description='no')">
                <xsl:value-of select="desc"/>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="text()"/>
</xsl:stylesheet>