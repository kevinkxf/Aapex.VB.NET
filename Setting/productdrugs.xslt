<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:template match="/">
		<xsl:variable name="nRows" select="2"/>
		<xsl:variable name="strRow0" select="'&lt;tr&gt;'"/>
		<xsl:variable name="strRow1" select="'&lt;tr&gt;'"/>
		<xsl:variable name="strTrRight" select="'&lt;/tr&gt;'"/>
		<table class="regular center w100" cellspacing="0">
			<tr>
				<th class="border_bottom">
					<xsl:apply-templates/>
				</th>
			</tr>
			<xsl:for-each select="//siteMapNodes/siteMapNode">
				<xsl:if test="position() mod $nRows = 1">
					<xsl:value-of select="$strRow0" disable-output-escaping="yes"/>
				</xsl:if>
				<xsl:if test="position() mod $nRows = 0">
					<xsl:value-of select="$strRow1" disable-output-escaping="yes"/>
				</xsl:if>
					<td >
						<xsl:apply-templates select="."/>
					</td>
				<xsl:value-of select="$strTrRight" disable-output-escaping="yes"/>
			</xsl:for-each>
		</table>
	</xsl:template >
	<xsl:template match="//siteMapNodes/siteMapNode">
		<a runat="server" >
			<xsl:attribute name="href">
				<xsl:value-of select="@url"/>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="@description"/>
			</xsl:attribute>
			<xsl:value-of select="@title"/>
		</a>
	</xsl:template>
	<xsl:template match="//siteMapNodes">
		<xsl:value-of select="@title"/>
	</xsl:template>
</xsl:stylesheet>
