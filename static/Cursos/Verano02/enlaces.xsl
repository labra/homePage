<?xml version="1.0" encoding="ISO-8859-1"?> <!-- Emacs Mode: -*- SGML -*- -->
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" indent="no" encoding="iso-8859-1"/>

<xsl:template match="enlaces">
<table>
<caption>Enlaces relacionados</caption>
<xsl:apply-templates />
</table>
</xsl:template>

<xsl:template match="enlace">
<tr>
<td>
 <xsl:element name="a">
 <xsl:attribute name="href">
   <xsl:value-of select="@href" />
 </xsl:attribute>
 <xsl:value-of select="@txt" />
</xsl:element>
</td>
</tr>
</xsl:template>
</xsl:stylesheet>




