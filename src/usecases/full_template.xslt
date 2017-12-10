<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="html" />
   <xsl:param name="pref" select="pref" />
   <xsl:template match="/">
      <div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../../../schema/fhir-single.xsd">
         <div id="segment-content" class="segment">
            <!-- segment-content -->
            <div class="container">
               <!-- container -->
               <div class="row">
                  <div class="inner-wrapper">
                     <!-- CONTENT CONTENT -->
                     <div class="col-12">
                        <ul class="nav nav-tabs">
                           <li class="active">
                              <a data-toggle="tab" href="#sequence">Sequence</a>
                           </li>
                           <li>
                              <a data-toggle="tab" href="#details">Details</a>
                           </li>
                           <li>
                              <a data-toggle="tab" href="#resources">Resources</a>
                           </li>
                        </ul>
                        <div class="tab-content">
                           <div id="sequence" class="tab-pane fade in active">
                              <h3>
                                 <a name="description" />
                                 Description
                              </h3>
                              <p>
                                 <xsl:value-of select="/ExampleScenario/description/@value" />
                              </p>
                              <h4>
                                 <a name="preconditions" />
                                 Pre-Conditions
                              </h4>
                              <p>
                                 <xsl:value-of select="/ExampleScenario/process/preConditions/@value" />
                              </p>
                              <h4>
                                 <a name="postconditions" />
                                 Post Conditions
                              </h4>
                              <p>
                                 <xsl:value-of select="/ExampleScenario/process/postConditions/@value" />
                              </p>
                              <p />
                              <img alt="Interaction diagram showing flow" src="{$pref}diagram.png" usemap="#diagram_map" />
                              <xsl:value-of select="unparsed-text('./diagram.cmapx')" disable-output-escaping="yes" />
                           </div>
                           <div id="details" class="tab-pane fade">
                              <h2>
                                 <a name="details" />
                                 Details
                              </h2>
                              <div>
                                 <table class="cols">
                                    <tr>
                                       <td>
                                          Publisher: (link?)
                                          <xsl:value-of select="/ExampleScenario/publisher/@value" />
                                       </td>
                                       <td>
                                          <a href="versions.html#maturity">Status</a>
                                          :
                                          <xsl:value-of select="/ExampleScenario/status/@value" />
                                       </td>
                                       <td>
                                          <a href="versions.html#maturity">Experimental</a>
                                          :
                                          <xsl:value-of select="/ExampleScenario/experimental/@value" />
                                       </td>
                                       <td>
                                          <a href="versions.html#maturity">Copyright</a>
                                          :
                                          <xsl:value-of select="/ExampleScenario/copyright/@value" />
                                       </td>
                                    </tr>
                                 </table>
                                 <table class="cols">
                                    <tr>
                                       <td>
                                          <a href="versions.html#maturity">Purpose</a>
                                          :
                                          <xsl:value-of select="/ExampleScenario/purpose/@value" />
                                       </td>
                                    </tr>
                                 </table>
                                 <p />
                                 <p />
                              </div>
                              <div>
                                 <h3>
                                    <a name="Actors" />
                                    Actors
                                 </h3>
                                 <table class="grid">
                                    <tbody>
                                       <tr>
                                          <th>Name</th>
                                          <th>Type</th>
                                          <th>Description</th>
                                       </tr>
                                       <xsl:apply-templates select="/ExampleScenario/actor" />
                                    </tbody>
                                 </table>
                                 <p />
                                 <p />
                              </div>
                              <div>
                                 <h3>
                                    <a name="flow" />
                                    Process Flow -
                                    <xsl:value-of select="/ExampleScenario/process/description/@value" />
                                 </h3>
                                 <xsl:apply-templates select="/ExampleScenario/process" />
                              </div>
                           </div>
                           <div id="resources" class="tab-pane fade">
                              <h3>Resources</h3>
                              <h2>Resources</h2>
                              <xsl:for-each-group select="ExampleScenario/instance/resourceType" group-by="@value">
                                 <xsl:apply-templates select="../resourceType" />
                              </xsl:for-each-group>
                           </div>
                        </div>
                        <!-- /row -->
                        <!--									
								</div>
-->
                     </div>
                     <!-- /container -->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </xsl:template>
   <xsl:template match="actor">
      <tr>
         <td>
            <b>
               <xsl:value-of select="name/@value" />
            </b>
         </td>
         <td>
            <xsl:value-of select="type/@value" />
         </td>
         <td>
            <xsl:value-of select="description/@value" />
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="/ExampleScenario/process">
      <!--		<h3><xsl:value-of select="title/@value"/></h3> <br/>  -->
      <div class="container">
         <div class="row">
            <div class="menu">
               <div class="accordion">
                  <!-- Áreas -->
                  <div class="accordion-group">
                     <div class="accordion-heading area">Main Flow</div>
                     <!-- /Área -->
                     start finish
                     <div class="accordion-body">
                        <div class="accordion-inner">
                           <div class="accordion">
                              <xsl:apply-templates select="step" />
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- /accordion -->
               </div>
            </div>
         </div>
      </div>
   </xsl:template>
   <xsl:template match="process">
      <xsl:value-of select="title/@value" />
      <ul>
         <xsl:apply-templates select="./step" />
      </ul>
   </xsl:template>
   <xsl:template match="step">
      <!-- Each Step -->
      <div class="accordion-group">
         <div class="accordion-heading">
            <a class="accordion-toggle" href="#{position()}" />
         </div>
         <div class="accordion-body" id="{position()}">
            <xsl:apply-templates select="./*" />
         </div>
         <!-- /Serviços -->
      </div>
      <p />
      <p />
   </xsl:template>
   <xsl:template match="operation">
      <a name="p2">
         <xsl:value-of select="number/@value" />
         .
      </a>
      <xsl:value-of select="name/@value" />
      <p />
      <xsl:value-of select="description/@value" />
      <p />
      <xsl:apply-templates select="./request" />
      <p />
      <xsl:apply-templates select="./response" />
      <p />
   </xsl:template>
   <xsl:template match="alternative">
      <a name="p2">
         Alternative:
         <xsl:value-of select="number/@value" />
      </a>
      <xsl:value-of select="name/@value" />
      <xsl:value-of select="description/@value" />
      <!-- IF STEP IS ALTERNATIVE -->
      <div class="accordion-inner">
         <div class="accordion">
            <xsl:apply-templates select="./option" />
            <!--
				<div class="accordion-group">
						<div class="accordion-heading ponto">
							<a class="accordion-toggle" data-toggle="collapse" href="{position()}">Option1 #1-1-1</a>
						</div>
						<div class="accordion-body" id="{position()}">
						<xsl:apply-templates select="./option"/>
						</div>
					</div>
					-->
         </div>
      </div>
   </xsl:template>
   <xsl:template match="option">
      <xsl:variable name="id" select="position()" />
      <xsl:variable name="optionname" select="./description/@value" />
      <div class="accordion-group">
         <div class="accordion-heading ponto">
            <a class="accordion-toggle" data-parent="{$id}" data-toggle="collapse" href="#{$id}">
               <xsl:value-of select="$id" />
               -
               <xsl:value-of select="./description/@value" />
            </a>
         </div>
         <!-- Serviços -->
         <div class="accordion-body" id="{$id}">
            <xsl:apply-templates select="./*" />
         </div>
         <!-- /Serviços -->
      </div>
   </xsl:template>
   <xsl:template match="pause">(pause)</xsl:template>
   <xsl:template match="request">
      <b>Request</b>
      (
      <xsl:value-of select="../receiver/@value" />
      -
      <xsl:value-of select="../initiator/@value" />
      ):
      <xsl:apply-templates select="./resourceId" />
   </xsl:template>
   <xsl:template match="response">
      <b>Response</b>
      (
      <xsl:value-of select="../receiver/@value" />
      -
      <xsl:value-of select="../initiator/@value" />
      ):
      <xsl:apply-templates select="./resourceId" />
   </xsl:template>
   <xsl:template match="resourceId">
      <xsl:variable name="iid" select="./@value" />
      <a href="example-instances.html#{/ExampleScenario/instance[resourceId/@value=$iid]/resourceId/@value}">
         <xsl:value-of select="/ExampleScenario/instance[resourceId/@value=$iid]/name/@value" />
      </a>
   </xsl:template>
   <xsl:template match="resourceType">
      <p />
      <xsl:variable name="thisResourceType" select="./@value" />
      <h3>
         <xsl:value-of select="$thisResourceType" />
      </h3>
      <table class="grid">
         <tbody>
            <tr>
               <th>Artifact</th>
               <th>Description</th>
               <th>Version</th>
               <th>Created by step</th>
               <th>Creating actor</th>
            </tr>
            <xsl:apply-templates select="../../instance[resourceType/@value=$thisResourceType]" />
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="instance">
      <tr>
         <td>
            <a name="{resourceId/@value}" href="../examples/{resourceId/@value}">
               <b>
                  <xsl:value-of select="name/@value" />
               </b>
            </a>
         </td>
         <td>
            <xsl:value-of select="description/@value" />
         </td>
         <td style="background-color:whitesmoke" colspan="3" />
      </tr>
   </xsl:template>
</xsl:stylesheet>