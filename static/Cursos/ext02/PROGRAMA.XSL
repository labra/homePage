<?xml version="1.0" encoding="ISO-8859-1"?> <!-- Emacs Mode: -*- SGML -*- -->
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" indent="no" encoding="iso-8859-1"/>

<xsl:include href="profes.xsl" />

<xsl:template match="programa">
<table>
<caption>Programa del curso</caption>
<col class="dia" />
<col class="sesion" />
<col class="contenido" />
<col class="material" />
<tr>
<th>Día</th>
<th>Sesión</th>
<th>Contenido</th>
<th>Material</th>
</tr>
<xsl:apply-templates />
</table>
</xsl:template>

<xsl:template match="sesion">
 <tr>
 <td>
  <p class="inTable"><xsl:value-of select="@fecha"/></p>
  <p class="inTable"><xsl:value-of select="@hora"/></p>
 </td>
 <td>
  <p class="inTable"><span class="item"><xsl:value-of select="@titulo"/></span></p>
  <p class="inTable"><xsl:apply-templates select="profe" /></p>
 </td>
<td>
 <ul>
 <xsl:for-each select="item">
  <li><xsl:apply-templates /></li>
 </xsl:for-each>
 </ul>
</td>
<td>
<xsl:apply-templates select="material"/>
</td>
</tr>
</xsl:template>

<xsl:key name="kprofe" match="profesor" use="@id" />

<xsl:template match="profe">
 <xsl:variable name="vref" select="@ref"/>
  <xsl:apply-templates select="document('profes.xml')//profesor[@id=$vref]"/>
</xsl:template>

<xsl:template match="material">
<ul>
 <li>
 <xsl:element name="a">
 <xsl:attribute name="href"><xsl:value-of select="@slides"/></xsl:attribute>
     Transparencias
 </xsl:element>
 </li>

<xsl:if test="not(string-length(@files)=0)">
<li>
<xsl:element name="a">
  <xsl:attribute name="href">
    <xsl:value-of select="@files"/>
  </xsl:attribute>
  Ficheros
  </xsl:element>
</li>
</xsl:if>

</ul>
</xsl:template>

</xsl:stylesheet>




