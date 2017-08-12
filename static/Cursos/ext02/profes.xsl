<?xml version="1.0" encoding="ISO-8859-1"?> <!-- Emacs Mode: -*- SGML -*- -->
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" indent="no" encoding="iso-8859-1"/>

<xsl:template match="profesor">
<xsl:element name="a">
 <xsl:attribute name="href">
  <xsl:value-of select="@href" />
 </xsl:attribute>
 <xsl:value-of select="@nombre" /> 
</xsl:element>
</xsl:template>

</xsl:stylesheet>




