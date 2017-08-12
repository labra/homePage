<?xml version="1.0" encoding="ISO-8859-1"?> <!-- Emacs Mode: -*- SGML -*- -->
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" indent="no" encoding="iso-8859-1"/>

<xsl:template match="alumnos">
<table>
<!--<caption>Notas del curso</caption>-->
<tr>
<th>DNI</th>
<th>Apellidos</th>
<th>Nombre</th>
<th>URL</th>
<th>Nota</th>
</tr>

<xsl:apply-templates select="alum">
 <xsl:sort data-type="number" select="./@dni" />
</xsl:apply-templates>
</table>
</xsl:template>

<xsl:template match="alum">
<tr>
<td class="alumno"><xsl:element name="a">
    <xsl:attribute name="href">
    mailto:<xsl:value-of select="@email" />
    </xsl:attribute>
    <xsl:value-of select="@dni"/>
   </xsl:element>
</td>
<td class="alumno"><xsl:value-of select="@apell"/></td>
<td class="alumno"><xsl:value-of select="@nombre"/></td>
<td class="alumno">
 <xsl:choose>
 <xsl:when test="not(string-length(@pagina))=0">
    <xsl:element name="a">
    <xsl:attribute name="href">
    <xsl:value-of select="@pagina" />
    </xsl:attribute>
    URL
   </xsl:element>
 </xsl:when>
 <xsl:otherwise>
  No disponible TODAVÍA!!!
 </xsl:otherwise>
 </xsl:choose>
</td>
<td class="alumno">
 <xsl:value-of select="@nota"/></td>
</tr>
</xsl:template>
</xsl:stylesheet>




