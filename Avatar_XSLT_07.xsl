<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Avatar: The Last Airbender Book 1</title>
            <!--link the CSS here!-->
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//episode"></xsl:apply-templates>
                </h1>
                <h2>
                    <em><xsl:apply-templates select="//book"></xsl:apply-templates></em>
                </h2>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>