<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Weather</title>
            </head>
            <style>
                td.label {font-weight: bold;
                            text-align: right;}
                td.data {padding-left:10px}
            </style>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="text()"/>
    <xsl:template match="current_observation">
        <h1>
            <xsl:value-of select="location"/>
        </h1>
        <table>
            <tbody>
                <tr>
                    <td>
                        <p style="float: left; text-align: center;">
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="icon_url_base"/>
                                    <xsl:value-of select="icon_url_name"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="weather"/>
                                </xsl:attribute>
                            </img>
                            <br/>
                            <xsl:value-of select="weather"/>
                        </p>
                        <td>
                            <h1>
                                <xsl:value-of select="temp_f"/>
                                <xsl:text> °F</xsl:text>
                            </h1>
                        </td>
                    </td>
                </tr>
            </tbody>
        </table>
        <br/>
        <table>
            <tbody>
                <tr>
                    <td class="label">Wind</td>
                    <td class="data">
                        <xsl:value-of select="wind_string"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">Humidity</td>
                    <td class="data">
                        <xsl:value-of select="relative_humidity"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">Pressure</td>
                    <td class="data">
                        <xsl:value-of select="pressure_in"/>
                        <xsl:text>''</xsl:text>
                    </td>
                </tr>
                <tr>
                    <td class="label">Dew Point</td>
                    <td class="data">
                        <xsl:value-of select="dewpoint_f"/>
                        <xsl:text> °F</xsl:text>
                    </td>
                </tr>
                <tr>
                    <td class="label">Visibility</td>
                    <td class="data">
                        <xsl:value-of select="visibility_mi"/>
                        <xsl:text> miles</xsl:text>
                    </td>
                </tr>
            </tbody>
        </table>
        <br/>
        <xsl:value-of select="observation_time"/>
        <p>
            <xsl:variable name="recent" select="two_day_history_url"/>
            <a href="{$recent}">Recent Observation History</a>
        </p>
        <p>
            <xsl:variable name="creditURL" select="credit_URL"/>
            <a href="{$creditURL}">
                <xsl:value-of select="credit"/>
            </a>
        </p>
    </xsl:template>
</xsl:stylesheet>