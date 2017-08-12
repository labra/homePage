<!--

TODOs:
3/1/10: Poner números de línea en el textarea

-->
<html>
<head><title>Show XML Namespaces</title></head>
<meta name="Author" content="Jose Emilio Labra Gayo">
<style type="text/css">

span.namespace { color:green; font-style: italic; }
span.text { color:gray; }

div.namespace { 
 border: solid 1px green;
 font-family : monospace;
}
div.form { 
}
ul { list-style: none; }

</style>
<body>
<h1>Show XML namespaces</h1>
<?php
if (!empty($_POST) && $_POST['contenidoXML']) {
	echo "<div class=\"namespace\">";

	$xml = stripslashes($_POST['contenidoXML']);

	$dom = new DomDocument();
	
	libxml_use_internal_errors(true);
	$dom -> loadXML($xml,LIBXML_NOERROR | LIBXML_NOWARNING);
	$errors = libxml_get_errors();
	if ($errors) {
		foreach ($errors as $error) {
			echo "<p>" . $error -> message . "</p>" ;
		}
		libxml_clear_errors();
	}
    else
		showDom($dom);
 
	}
	echo "</div>";
	

function showDom($dom) {
 switch ($dom->nodeType) {
  case XML_DOCUMENT_NODE: 
			if ($dom->hasChildNodes()) {
				echo "<ul>";
				foreach ($dom->childNodes as $n) {
					echo "<li>";
					showDom($n);
					echo "</li>";
				}
				echo "</ul>";
			}
			// showDom($dom->documentElement);
			break;
  case XML_ELEMENT_NODE:
			echo "<ul><li>";
			$name = $dom->localName;
			
			echo '&lt;';
			if ($dom->namespaceURI) {
			 echo '<span class="namespace">[' . $dom->namespaceURI . ']</span>' ;
			}
			echo $name ;
			

			if ($dom->hasAttributes()) {
			 echo " ";
			 foreach ($dom->attributes as $a) {
			  showDom($a);
			 }
			} 
			echo "&gt;</li>";
			if ($dom->hasChildNodes()) {
				echo "<ul>";
				foreach ($dom->childNodes as $n) {
					echo "<li>";
					showDom($n);
					echo "</li>";
				}
				echo "</ul>";
			}	
			echo "<li>";
			echo "&lt;/" . $name . "&gt;</li></ul>";  
			break;
	case XML_ATTRIBUTE_NODE:
			if ($dom->namespaceURI) {
			 echo '<span class="namespace">[' . $dom->namespaceURI . ']</span>' ;
			 echo $dom->localName;
			}
			else echo $name ;
			echo "=&quot;" . $dom->value . "&quot;";
			break;
	case XML_TEXT_NODE :
			echo "<span class='text'>" . $dom->nodeValue . "</span>" ;
			break;
	case XML_PI_NODE :
			echo "&lt;?" . $dom->target . " " . $dom->data . "?&gt;" ;
			break;
	case XML_COMMENT_NODE :
			echo "&lt;!--" . $dom->data . "--&gt;" ;
			break;
	}
} 
 
?>
<div class="form">
<form 
   action="http://di002.edv.uniovi.es/~labra/cursos/XML/showNamespaces/index.php" 
   method="post"
   enctype="multipart/form-data" >
 <p>
<textarea 
 rows="15" 
 cols="50" 
 id="xml"
 name="contenidoXML"><?php echo $xml; ?></textarea>
</p> 
<button type="submit">Analizar</button>
<button type="reset">Borrar</button>
</form>
</div>
</body>
</html>
