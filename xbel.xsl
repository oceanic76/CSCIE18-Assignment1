<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
    <xsl:param name="description" select="'yes'"/>
    <xsl:template match="/"><!-- Criteria - XBEL - Title in head and also in h1 in body. Use a variable to define title. -->
        <xsl:variable name="title" select="xbel/title"/>
        <html>
            <head>
                <title><!-- Requirement - XBEL title should be the title of the page (both visibly as part of the body and in the title element in the HTML head) -->
                    <xsl:value-of select="$title"/>
                </title>
            </head>
            <body>
                <h1><!-- Requirement - XBEL title should be the title of the page (both visibly as part of the body and in the title element in the HTML head) -->
                    <xsl:value-of select="$title"/>
                </h1><!-- Requirement - Produce a nested list HTML unordered lists based on the nested folder structure of the XBEL source XML.  Folder titles should be displayed -->
                <ul><!-- XBEL - "Push" Style -->
                    <xsl:apply-templates/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="folder">
        <li><!-- Requirement - Produce a nested list HTML unordered lists based on the nested folder structure of the XBEL source XML.  Folder titles should be displayed 
                                Create well-formed lists  nested lists should be fully contained within their parent "li" element i.e. "ul" elements should not be children of "ul" elements. 
                                -->
            <xsl:value-of select="title"/><!-- avoid potentially creating empty "ul" elements in your output. -->
            <xsl:if test="folder|bookmark">
                <ul>
                    <xsl:apply-templates/><!-- select statement seems unnecessary due to the text() template
                    <xsl:apply-templates select="folder|bookmark"/>
                    -->
                </ul>
            </xsl:if><!-- avoid potentially creating empty "ul" elements in your output. -->
        </li>
    </xsl:template>
    <xsl:template match="bookmark">
        <li><!-- Requirement - Bookmark titles should be displayed and linked to the "href" -->
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="@href"/>
                </xsl:attribute>
                <xsl:value-of select="title"/>
            </a>
            <br/><!-- Requirement - Accept and use a parameter named "description".  Default value should be "yes".  
                    If description is set to "no", bookmark descriptions should not be included in the output. 
                    XBEL description parameter, if description is anything other than no, descritions are displayed. -->
            <xsl:if test="not($description='no')">
                <xsl:value-of select="desc"/>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="text()"/>
</xsl:stylesheet>