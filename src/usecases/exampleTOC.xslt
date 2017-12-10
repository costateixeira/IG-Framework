<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
		<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../../../schema/fhir-single.xsd">
<p> This page presents some use cases.</p> 

<div id="segment-content" class="segment"><!-- segment-content -->
<div class="container"><!-- container -->
<div class="row">
<div class="inner-wrapper"><!-- CONTENT CONTENT -->
<!-- {% include toc.xml %} -->

<div class="col-12">
<br></br>

	<xsl:for-each select="collection('?select=*.xml')">
	<xsl:variable name="filename" select="concat(tokenize(substring(document-uri(.), 1, string-length(document-uri(.)) - 4), '/')[last()],'-scenario.html')" />
    <!--process nodes-->
		<ul>
			<li><p><b><a href="{$filename}"><xsl:value-of select="/ExampleScenario/title/@value"/></a></b></p></li>
		<p><xsl:value-of select="/ExampleScenario/description/@value"/></p>
		</ul>
	 	
    </xsl:for-each>
	
</div>
</div>

</div>
</div> 

</div>
	
	</div>
</xsl:template>

</xsl:stylesheet>




