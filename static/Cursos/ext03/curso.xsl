<?xml version="1.0" encoding="ISO-8859-1"?> <!-- Emacs Mode: -*- SGML -*- -->
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" indent="no" encoding="iso-8859-1"/>

<xsl:include href="programa.xsl" />
<xsl:include href="alumnos.xsl" />
<xsl:include href="enlaces.xsl" />
<xsl:include href="lugares.xsl" />

<xsl:param name="url">http://www.di.uniovi.es/~labra/cursos/ext03/</xsl:param>

<xsl:template match="curso"> 
  <html>
    <head>
	<title>Curso de Extensión Universitaria</title>
	<link rel="stylesheet" href="../cursos.css" />
	
	<script type="text/javascript">
	<xsl:text>
	<![CDATA[
	<!--
    if (document.images)
         {
             logo1     = new Image(120,120);
             logo2     = new Image(120,120);
             logo1.src = "../Images/logo-xml.gif";
             logo2.src = "../Images/logo-xmlLadrillos.gif";
         }

    function cambia(nombre, imagen) {  
     if (document.images) {
      document[nombre].src = eval(imagen+".src");
    }
   }
    // -->
    ]]>
    </xsl:text>
	</script>

    </head>

  <body>
   <div class="header">
   <p><a href="#datos">Datos</a> |
      <a href="#programa">Programa</a> |
      <a href="#alumnos">Alumnos/NOTAS</a> |
      <a href="#evaluacion">Evaluacion</a> |
      <a href="#enlaces">Enlaces</a></p>
   </div>
   <table class="header">
   <tr><td>
     <img name="logo1"
            width="120" 
            height="120" 
            src="../images/logo-xml.gif" 
            onMouseOver='cambia("logo1", "logo2")' 
            onMouseOut='cambia("logo1", "logo1")' />
    </td>
       <td><h1 class="header"><xsl:value-of select="@titulo"/></h1></td>
   </tr>
   </table>
   <h2><a name="datos">Datos del curso</a></h2>
    <ul>
     <li><span class="item">Dirección</span>: <xsl:apply-templates select="direccion"/></li>
     <li><span class="item">Fechas</span>: <xsl:apply-templates select="fechas"/></li>
     <li><span class="item">Lugar</span>: <xsl:apply-templates select="reflugar"/></li>
     <li><span class="item">Plazas</span>: <xsl:apply-templates select="plazas"/></li>
<!--     <li><span class="item">Derechos</span>: 
               <xsl:apply-templates select="derechos"/> &#x20ac;</li> -->
     <li><span class="item">Requisitos</span>: <xsl:apply-templates select="requisitos"/></li>
     <li><span class="item">Tipo</span>: <xsl:apply-templates select="tipo"/></li>
     <li><span class="item">Objetivos</span>: <xsl:apply-templates select="objetivos"/></li>
     </ul>
   <h2><a name="programa">Programa</a></h2>
   <xsl:apply-templates select="programa"/>
   <h2><a name="evaluacion">Evaluacion</a></h2>
   <xsl:apply-templates select="evaluacion"/>
   <h2><a name="alumnos">Alumnos</a></h2>
   <a href="http://petra.euitio.uniovi.es/cgi-bin/plf/curso.cgi">
   Información personalizada de alumnos (actualizar los campos que faltan)
   </a>
<!--<xsl:apply-templates select="alumnos"/>-->
   <h2><a name="enlaces">Enlaces</a></h2>
   <xsl:apply-templates select="enlaces" />
  </body>
 </html>
</xsl:template> 

<xsl:template match="direccion">
  <xsl:variable name="vref" select="@ref"/>
  <xsl:apply-templates select="document('profes.xml')//profesor[@id=$vref]"/>
</xsl:template>

<xsl:template match="p">
<p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="ul">
<ul><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="li">
<li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template match="reflugar">
  <xsl:variable name="lref" select="@ref"/>
  <xsl:apply-templates select="document('lugares.xml')//lugar[@id=$lref]"/>
</xsl:template>

</xsl:stylesheet>




