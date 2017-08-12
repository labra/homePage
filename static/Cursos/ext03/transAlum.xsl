<?xml version="1.0" encoding="ISO-8859-1"?> <!-- Emacs Mode: -*- SGML -*- -->
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="xml" indent="no" encoding="iso-8859-1"/>

<xsl:template match="alumnos">
<alumnos>
<xsl:apply-templates select="alum">
 <xsl:sort data-type="number" select="./@dni" />
</xsl:apply-templates>
</alumnos>
</xsl:template>

<xsl:template match="alum">
<alumno>
<nombre><xsl:value-of select="@nombre" /></nombre>
<apells><xsl:value-of select="@apell" /></apells>
<dni><xsl:value-of select="@dni" /></dni>
<url><xsl:value-of select="@pagina" /></url>
<email><xsl:value-of select="@email" /></email>
<tlfno><xsl:value-of select="@tlfno" /></tlfno>
<nota><xsl:value-of select="@nota" /></nota>
</alumno>
</xsl:template>
</xsl:stylesheet>




