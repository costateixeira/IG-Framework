<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>


	<xsl:variable name="rows" select="/ss:Workbook/ss:Worksheet[@ss:Name='Glossary']/ss:Table/ss:Row" />
	<xsl:variable name="header-row" select="$rows[1]" />
	<xsl:variable name="header-row-num" select="index-of($rows, $header-row)" />


	<xsl:variable name="cells" select="/ss:Workbook/ss:Worksheet[@ss:Name='Glossary']/ss:Table/ss:Row/ss:Cell" />

	<xsl:variable name="term_cell" select="$cells/ss:Data[text()='Term']" />
	<xsl:variable name="term_col" select="index-of($cells, $term_cell)" />

	<xsl:variable name="def_cell" select="$cells/ss:Data[text()='Definition']" />
	<xsl:variable name="definition_col" select="index-of($cells, $def_cell)" />



	<xsl:variable name="header-row-cells" select="$header-row/ss:Cell" />
	<xsl:variable name="term-col-num" select="index-of($header-row-cells, $header-row-cells[ss:Data='Term'][1])" />
	<xsl:variable name="definition-col-num" select="index-of($header-row-cells, $header-row-cells[ss:Data='Definition'][1])" />




	<xsl:template match="/">

		<xsl:for-each select="ss:Workbook/ss:Worksheet[@ss:Name='Glossary']">

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../../../schema/fhir-single.xsd">
		
	<div><a name="Glossary"/>
				<table class="table table-bordered table-striped table-bordered">
					<tbody>
						<xsl:apply-templates select="ss:Table/ss:Row"/>
					</tbody>
				</table>

			</div>
			</div>
		</xsl:for-each>
	</xsl:template>
<!--
	<xsl:template match="ss:Row[1]">
		<tr>
			<xsl:for-each select="ss:Cell">
				<th>
					<xsl:value-of select="ss:Data"/>
				</th>
			</xsl:for-each>
		</tr>
	</xsl:template>

-->
	<xsl:template match="ss:Row">
		<tr>


  <xsl:if test="position()=1">
				<th width="275"><xsl:value-of select="ss:Cell[$term-col-num]/ss:Data"/></th>
				<th><xsl:value-of select="ss:Cell[$definition-col-num]/ss:Data"/></th>
				
  </xsl:if>
  <xsl:if test="position() gt 1">
				<td width="275"><xsl:value-of select="ss:Cell[$term-col-num]/ss:Data"/></td>
				<td>
					<xsl:value-of select="ss:Cell[@ss:Index='7']/ss:Data"/>
					<xsl:value-of select="ss:Cell[$definition-col-num]/ss:Data"/>
			
				</td>
  </xsl:if>


		



		</tr>

	</xsl:template>




</xsl:stylesheet>

