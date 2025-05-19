<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lido="http://www.lido-schema.org" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:crm="http://www.cidoc-crm.org/cidoc-crm/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:gml="http://www.opengis.net/gml">
    <xsl:output method="xml" indent="yes"/> 

    <!-- lido:lido -->
    <xsl:template match="lido:lido">
        <crm:E22_Man-Made_Object rdf:about="http://example.org/object/{lido:lidoRecID[1]}">
            <xsl:apply-templates select="lido:descriptiveMetadata"/>
            <xsl:apply-templates select="lido:administrativeMetadata"/>
        </crm:E22_Man-Made_Object>
    </xsl:template>

    <!-- descriptiveMetadata -->
    <xsl:template match="lido:descriptiveMetadata">
        <xsl:apply-templates select="lido:objectClassificationWrap"/> <!--1.objClass-->
        <xsl:apply-templates select="lido:objectIdentificationWrap"/> <!--2.objIden-->
        <xsl:apply-templates select="lido:eventWrap"/> <!--3.event-->
    </xsl:template>


    <!--1.objClass-->
    <xsl:template match="lido:objectClassificationWrap">
        <xsl:apply-templates select="lido:objectWorkTypeWrap/lido:objectWorkType"/>
    </xsl:template>

    <xsl:template match="lido:objectWorkType"> <!--1.1.type-->
        <crm:P2_has_type>
            <crm:E55_Type rdf:about="{skos:Concept/@rdf:about}">
                <xsl:for-each select="skos:Concept/skos:prefLabel">
                    <rdfs:label xml:lang="{@xml:lang}">
                      <xsl:value-of select="."/>
                    </rdfs:label>
                </xsl:for-each>
                <xsl:for-each select="skos:Concept/skos:altLabel">
                    <rdfs:label xml:lang="{@xml:lang}">
                      <xsl:value-of select="."/>
                    </rdfs:label>
                </xsl:for-each>
            </crm:E55_Type>
        </crm:P2_has_type>
    </xsl:template>

    <!--2.objIden-->
    <xsl:template match="lido:objectIdentificationWrap">
        <xsl:apply-templates select="lido:titleWrap"/>
        <xsl:apply-templates select="lido:objectMeasurementsWrap"/>
        <xsl:apply-templates select="lido:objectMaterialsTechWrap"/>
    </xsl:template>

    <xsl:template match="lido:titleWrap"> <!--2.1.title-->
        <crm:P102_has_title>
            <xsl:value-of select="lido:titleSet/lido:appellationValue"/>
        </crm:P102_has_title>
    </xsl:template>

    <xsl:template match="lido:objectMeasurementsWrap"> <!--2.2.measurements-->
        <xsl:apply-templates select="lido:objectMeasurementsSet/lido:objectMeasurements/lido:measurementsSet"/>
    </xsl:template>

    <xsl:template match="lido:measurementsSet">
        <crm:P43_has_dimension>
            <crm:E54_Dimension>     
                   <crm:P2_has_type>
                        <crm:E55_Type rdf:about="{lido:measurementType/skos:Concept/@rdf:about}">
                            <xsl:for-each select="lido:measurementType/skos:Concept/skos:prefLabel">
                              <rdfs:label xml:lang="{@xml:lang}">
                                <xsl:value-of select="."/>
                              </rdfs:label>
                            </xsl:for-each>
                        </crm:E55_Type>
                    </crm:P2_has_type>
                    <crm:P91_has_unit>
                        <crm:E58_MeasurementUnit rdf:about="{lido:measurementUnit/skos:Concept/@rdf:about}">
                            <xsl:for-each select="lido:measurementUnit/skos:Concept/skos:prefLabel">
                              <rdfs:label xml:lang="{@xml:lang}">
                                <xsl:value-of select="."/>
                              </rdfs:label>
                            </xsl:for-each>
                        </crm:E58_MeasurementUnit>
                    </crm:P91_has_unit>
                    <crm:P90_has_value>
                        <xsl:value-of select="lido:measurementValue"/>
                    </crm:P90_has_value>
            </crm:E54_Dimension>
        </crm:P43_has_dimension>
    </xsl:template>

    <xsl:template match="lido:objectMaterialsTechWrap"> <!--2.3.Materials-->
        <xsl:apply-templates select="lido:objectMaterialsTechSet/lido:materialsTech"/>
    </xsl:template>
    <xsl:template match="lido:materialsTech">
        <crm:P45_consists_of>
            <crm:E57_Material>
              <crm:P2_has_type>
                  <crm:E55_Type rdf:about="{lido:termMaterialsTech/skos:Concept/@rdf:about}">
                    <rdfs:label xml:lang="{lido:termMaterialsTech/skos:Concept/skos:prefLabel/@xml:lang}">
                        <xsl:value-of select="lido:termMaterialsTech/skos:Concept/skos:prefLabel"/>
                    </rdfs:label>
                  </crm:E55_Type>
              </crm:P2_has_type>
            </crm:E57_Material>
        </crm:P45_consists_of>
    </xsl:template>

    <!--3.event-->
    <xsl:template match="lido:eventWrap">
        <xsl:apply-templates select="lido:eventSet"/>
    </xsl:template>

    <xsl:template match="lido:eventSet">
        <xsl:apply-templates select="lido:event"/>
    </xsl:template>

    <xsl:template match="lido:event">
        <xsl:variable name="eventValue" select="normalize-space(lido:eventType/skos:Concept/lido:prefLabel[@xml:lang='en'])"/>
        <xsl:variable name="eventURI" select="lido:eventType/skos:Concept/@rdf:about"/>

        <xsl:choose>   <!-- in the case of Event_Production -->
            <xsl:when test="$eventValue = 'Production'">
              <crm:P108_was_produced_by>
                <crm:E12_Production rdf:about="{$eventURI}">
                    <xsl:for-each select="lido:eventType/skos:Concept/lido:prefLabel">
                        <rdfs:label xml:lang="{@xml:lang}">
                            <xsl:value-of select="."/>
                        </rdfs:label>
                    </xsl:for-each>
                    
                    <xsl:apply-templates select="lido:eventActor"/> <!--3.1.eventActor-->
                    <xsl:apply-templates select="lido:eventDate"/>  <!--3.2.eventDate-->
                </crm:E12_Production>
              </crm:P108_was_produced_by>  
            </xsl:when>

            <!-- in the case of Event Acquisition -->
            <xsl:when test="$eventValue = 'Acquisition'">
              <crm:P24i_changed_ownership_through>
                <crm:E8_Acquisition rdf:about="{$eventURI}">
                    <xsl:for-each select="lido:eventType/skos:Concept/lido:prefLabel">
                        <rdfs:label xml:lang="{@xml:lang}">
                            <xsl:value-of select="."/>
                        </rdfs:label>
                    </xsl:for-each>

                    <xsl:apply-templates select="lido:eventActor"/>
                    <xsl:apply-templates select="lido:eventDate"/>
                </crm:E8_Acquisition>
              </crm:P24i_changed_ownership_through>  
            </xsl:when>     
        </xsl:choose>
    </xsl:template>

    <xsl:template match="lido:eventActor">
        <xsl:apply-templates select="lido:actorInRole"/>
    </xsl:template>
 
    <xsl:template match="lido:actorInRole">
        <xsl:apply-templates select="lido:actor"/>
        <xsl:apply-templates select="lido:roleActor"/>
    </xsl:template>

    <!-- 3.1.eventActor_actor -->
    <xsl:template match="lido:actor">
        <crm:P14_carried_out_by>
            <crm:E39_Actor rdf:about="{@lido:type}">                
                <xsl:for-each select="lido:actorID">
                  <xsl:if test="@lido:type = 'http://terminology.lido-schema.org/lido00100' or @lido:type = 'http://terminology.lido-schema.org/lido00099'">
                      <crm:P1_is_identified_by>
                          <crm:E42_Identifier rdf:about="{@lido:type}">
                              <rdfs:label>
                                  <xsl:value-of select="."/>
                              </rdfs:label>
                          </crm:E42_Identifier>
                      </crm:P1_is_identified_by>
                  </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="lido:nameActorSet/lido:appellationValue">
                    <crm:P1_is_identified_by>
                        <crm:E41_Appellation>
                             <xsl:choose>
                                <xsl:when test="@lido:pref = 'http://terminology.lido-schema.org/lido00170'">
                                    <crm:P139_has_alternative_form>
                                      <rdfs:label xml:lang="{@xml:lang}">
                                        <xsl:value-of select="."/>
                                      </rdfs:label>
                                    </crm:P139_has_alternative_form>
                                </xsl:when>
                                <xsl:otherwise>
                                    <rdfs:label xml:lang="{@xml:lang}">
                                        <xsl:value-of select="."/>
                                    </rdfs:label>
                                </xsl:otherwise>
                            </xsl:choose>
                        </crm:E41_Appellation>
                    </crm:P1_is_identified_by>
                </xsl:for-each>

                <xsl:apply-templates select="lido:nationalityActor"/>
                <xsl:apply-templates select="lido:vitalPlaceActor"/>
                <xsl:apply-templates select="lido:vitalDatesActor"/>
                <xsl:apply-templates select="lido:genderActor"/>
            </crm:E39_Actor>
        </crm:P14_carried_out_by>
    </xsl:template>

    <xsl:template match="lido:roleActor"> 
      <crm:P14.1_in_the_role_of>
        <crm:E55_Type rdf:about="{skos:Concept/@rdf:about}"> 
            <crm:P1_is_identified_by>
                <crm:E41_Appellation>
                    <rdfs:label xml:lang="{@xml:lang}">
                        <xsl:value-of select="skos:Concept/skos:prefLabel"/>
                    </rdfs:label>
                </crm:E41_Appellation>
            </crm:P1_is_identified_by>
        </crm:E55_Type>
      </crm:P14.1_in_the_role_of>
    </xsl:template> 

      <xsl:template match="lido:nationalityActor">
        <crm:P107_has_current_or_former_member>
            <crm:E74_Group rdf:about="{skos:Concept/@rdf:type}">
              <rdfs:label>
                  <xsl:value-of select="skos:Concept/skos:prefLabel"/>
              </rdfs:label>
            </crm:E74_Group>
        </crm:P107_has_current_or_former_member>
      </xsl:template>

      <xsl:template match="lido:vitalPlaceActor">
        <crm:P98i_was_born>
              <crm:E67_Birth>
                  <crm:P7_took_place_at>
                      <crm:E53_Place rdf:about="{lido:placeID/text()}">
                          <xsl:apply-templates select="lido:namePlaceSet"/>
                          <xsl:apply-templates select="lido:gml"/>
                          <xsl:apply-templates select="lido:placeClassification"/>
                          <xsl:apply-templates select="lido:partOfPlace"/>
                      </crm:E53_Place>
                  </crm:P7_took_place_at>
              </crm:E67_Birth>
          </crm:P98i_was_born>
      </xsl:template>

    <xsl:template match="lido:partOfPlace">
        <crm:P89_falls_within>
            <crm:E53_Place rdf:about="{lido:placeID/text()}">
                <xsl:apply-templates select="lido:namePlaceSet"/>
                <xsl:apply-templates select="lido:gml"/>
                <xsl:apply-templates select="lido:placeClassification"/>
            </crm:E53_Place>
        </crm:P89_falls_within>
    </xsl:template>

    <xsl:template match="lido:namePlaceSet">
        <crm:P1_is_identified_by>
            <crm:E41_Appellation>
                <xsl:for-each select="lido:appellationValue">
                    <rdfs:label xml:lang="{@xml:lang}">
                        <xsl:value-of select="."/>
                    </rdfs:label>
                </xsl:for-each>
            </crm:E41_Appellation>
        </crm:P1_is_identified_by>
    </xsl:template>

    <xsl:template match="lido:gml">
        <xsl:apply-templates select="gml:Point"/>
    </xsl:template>

    <xsl:template match="gml:Point">
        <xsl:if test="gml:pos">
          <xsl:variable name="coords" select="normalize-space(gml:pos)"/>
             <crm:P168_place_is_defined_by>
                <crm:E94_Space_Primitive>
                    <gml:Point>
                        <gml:coordinates>
                            <xsl:value-of select="translate($coords, ' ', ', ')"/>
                        </gml:coordinates>
                    </gml:Point>
                </crm:E94_Space_Primitive>
            </crm:P168_place_is_defined_by>
        </xsl:if>
    </xsl:template>

    <xsl:template match="lido:placeClassification">
        <xsl:if test="skos:Concept">
            <crm:P2_has_type>
                <crm:E55_Type rdf:about="{skos:Concept/@rdf:about}">
                    <xsl:for-each select="skos:Concept/skos:prefLabel">
                        <rdfs:label xml:lang="{@xml:lang}">
                            <xsl:value-of select="."/>
                        </rdfs:label>
                    </xsl:for-each>
                </crm:E55_Type>
            </crm:P2_has_type>
            <xsl:for-each select="skos:Concept/skos:altLabel">
                <crm:P139_has_alternative_form>
                    <crm:E55_Type rdf:about="{../../skos:Concept/@rdf:about}">
                        <rdfs:label xml:lang="{@xml:lang}">
                            <xsl:value-of select="."/>
                        </rdfs:label>
                    </crm:E55_Type>
                </crm:P139_has_alternative_form>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
             
    <xsl:template match="lido:vitalDatesActor">
      <crm:P98i_was_born>
          <crm:E67_Birth>
              <crm:P4_has_time-span>
                  <crm:E52_Time-Span>
                      <crm:P82a_begin_of_the_begin>
                        <xsl:value-of select="lido:earliestDate"/>
                      </crm:P82a_begin_of_the_begin>
                      <crm:P82b_end_of_the_end>
                        <xsl:value-of select="lido:latestDate"/>
                      </crm:P82b_end_of_the_end>  
                  </crm:E52_Time-Span>
              </crm:P4_has_time-span>
          </crm:E67_Birth>
      </crm:P98i_was_born>
    </xsl:template>

    <xsl:template match="lido:genderActor">  <!--no gender voca in crm-->
       <crm:P107_has_current_or_former_member>
        <crm:E74_Group rdf:about="{skos:Concept/@rdf:about}">
          <xsl:for-each select="skos:Concept/lido:prefLabel">
            <rdfs:label xml:lang="{@xml:lang}">
              <xsl:value-of select="."/>
            </rdfs:label>
          </xsl:for-each>
        </crm:E74_Group>
      </crm:P107_has_current_or_former_member>
    </xsl:template>

    <xsl:template match="lido:eventDate">
      <xsl:apply-templates select="lido:date"/>
    </xsl:template>

    <xsl:template match="lido:date">
        <crm:P4_has_time-span>
            <crm:E52_Time-Span>
                  <crm:P82a_begin_of_the_begin>
                    <xsl:value-of select="lido:earliestDate"/>
                  </crm:P82a_begin_of_the_begin>
                  <crm:P82b_end_of_the_end>
                    <xsl:value-of select="lido:latestDate"/>
                  </crm:P82b_end_of_the_end>  
            </crm:E52_Time-Span>
        </crm:P4_has_time-span>
    </xsl:template>
  

    <!-- administrativeMetadata -->
    <xsl:template match="lido:administrativeMetadata">
        <xsl:apply-templates select="lido:recordWrap"/>
    </xsl:template>
 
    <xsl:template match="lido:recordWrap">
        <crm:P70i_is_documented_in>
            <crm:E31_Document>
                <xsl:apply-templates select="lido:recordSource"/>
                <xsl:apply-templates select="lido:recordRights"/>
                <xsl:apply-templates select="lido:collection"/>
            </crm:E31_Document>
        </crm:P70i_is_documented_in>
    </xsl:template>
 
    <xsl:template match="lido:recordSource">
        <crm:P70i_is_documented_in>
            <crm:E31_Document>
                <crm:P1_is_identified_by>
                    <xsl:value-of select="lido:legalBodyName/lido:appellationValue"/>
                </crm:P1_is_identified_by>
            </crm:E31_Document>
        </crm:P70i_is_documented_in>
    </xsl:template>

    <xsl:template match="lido:recordRights">
        <crm:P52_has_current_owner>
            <crm:E39_Actor>
              <rdfs:label>
                <xsl:value-of select="lido:creditLine"/>
              </rdfs:label>  
            </crm:E39_Actor>
        </crm:P52_has_current_owner>
    </xsl:template>

    <xsl:template match="lido:collection">
        <crm:P46_is_composed_of>
            <crm:E78_Collection>
                <xsl:apply-templates select="lido:object"/>
            </crm:E78_Collection>
        </crm:P46_is_composed_of>
    </xsl:template>

    <xsl:template match="lido:object">
        <crm:P46_is_composed_of>
            <crm:E22_Man-Made_Object>
                <crm:P1_is_identified_by>
                    <xsl:value-of select="lido:objectName/lido:appellationValue"/>
                </crm:P1_is_identified_by>
            </crm:E22_Man-Made_Object>
        </crm:P46_is_composed_of>
    </xsl:template>
</xsl:stylesheet>