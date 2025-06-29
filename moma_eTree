LIDO_NS = "http://www.lido-schema.org"
SKOS_NS = "http://www.w3.org/2004/02/skos/core#"
RDF_NS = "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
OWL_NS = "http://www.w3.org/2002/07/owl#"
GML_NS = "http://www.opengis.net/gml"
DOC_NS = "http://www.mda.org.uk/spectrumXML/Documentation"
SCH_NS = "http://purl.oclc.org/dsdl/schematron"
TEI_NS = "http://www.tei-c.org/ns/1.0"
XLINK_NS = "http://www.w3.org/1999/xlink"
SMIL_NS = "http://www.w3.org/2001/SMIL20/Language"
XMLschema_NS = "http://www.w3.org/2001/XMLSchema-instance"
XML_NS = "http://www.w3.org/XML/1998/namespace"

ns_map = {"lido": LIDO_NS, "skos": SKOS_NS, "rdf": RDF_NS, "owl": OWL_NS, "gml": GML_NS, "doc": DOC_NS, "sch": SCH_NS, "tei": TEI_NS, "xlink": XLINK_NS, "smil20lang": SMIL_NS, "xsi": XMLschema_NS}
root = etree.Element(f"{{{LIDO_NS}}}lido", nsmap=ns_map)
category = etree.SubElement(root, f"{{{LIDO_NS}}}category")
concept = etree.SubElement(category, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "http://terminology.lido-schema.org/lido00096"})
pref_label = etree.SubElement(concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
pref_label.text = "Human-made object"
exact_match1 = etree.SubElement(concept, f"{{{SKOS_NS}}}exactMatch")
exact_match1.text = "http://vocab.getty.edu/aat/300386957"
exact_match2 = etree.SubElement(concept, f"{{{SKOS_NS}}}exactMatch")
exact_match2.text = "http://erlangen-crm.org/current/E22_Human-Made_Object"
term = etree.SubElement(category, f"{{{LIDO_NS}}}term", attrib={f"{{{LIDO_NS}}}addedSearchTerm": "yes"})
term.text = "man-made object"

for _, row in df_aTribute.iterrows():
    lido = etree.SubElement(root, f"{{{LIDO_NS}}}lido")
    descriptive_metadata = etree.SubElement(lido, f"{{{LIDO_NS}}}descriptiveMetadata",  attrib={f"{{{XML_NS}}}lang": "en"})
    administrative_metadata = etree.SubElement(lido, f"{{{LIDO_NS}}}administrativeMetadata",  attrib={f"{{{XML_NS}}}lang": "en"})
    
    title_value = str(row["Title"])
    medium_value = str(row["Medium"])
    artist_value = str(row["Artist"])
    constituentID_value = str(row["ConstituentID"])
    nationality_value = str(row["Nationality"])
    beginDate_value = str(row["BeginDate"])
    endDate_value = str(row["EndDate"])
    gender_value = str(row["Gender"])
    date_value = str(row["Date"])
    dimensions_value = str(row["Dimensions"])
    creditLine_value = str(row["CreditLine"])
    accessionNumber_value = str(row["AccessionNumber"])
    classification_value = str(row["Classification"])
    department_value = str(row["Department"])    
    dateAcquired_value = str(row["DateAcquired"])
    cataloged_value = str(row["Cataloged"])
    objectID_value = str(row["ObjectID"])
    URL_value = str(row["URL"])
    imageURL_value = str(row["ImageURL"])
    onView_value = str(row["OnView"])
    circumference_value = str(row["Circumference (cm)"])
    depth_value = str(row["Depth (cm)"])
    diameter_value = str(row["Diameter (cm)"])
    height_value = str(row["Height (cm)"])
    length_value = str(row["Length (cm)"])
    weight_value = str(row["Weight (kg)"])
    width_value = str(row["Width (cm)"])
    seatHeight_value = str(row["Seat Height (cm)"])
    duration_value = str(row["Duration (sec.)"])
    min_value = str(row["min"])
    sec_value = str(row["sec"])
    
    # classification
    object_classification_wrap = etree.SubElement(descriptive_metadata, f"{{{LIDO_NS}}}objectClassificationWrap")
    object_worktype_wrap = etree.SubElement(object_classification_wrap, f"{{{LIDO_NS}}}objectWorkTypeWrap")
    displayObjectWorktype_wrap = etree.SubElement(object_worktype_wrap, f"{{{LIDO_NS}}}displayObjectWorkType")
    displayObjectWorktype_wrap.text = classification_value 
    
    
    # 1.title: objectIdentificationWrap-> titleWrap -> titleSet-> objectTitle -> appellationVlalue     
    object_identification_wrap = etree.SubElement(descriptive_metadata, f"{{{LIDO_NS}}}objectIdentificationWrap")
    title_wrap = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}titleWrap", attrib={f"{{{LIDO_NS}}}type": "http://vocab.getty.edu/aat/300417206"}) #aat title
    title_set = etree.SubElement(title_wrap, f"{{{LIDO_NS}}}titleSet")
    object_title = etree.SubElement(title_set, f"{{{LIDO_NS}}}objectTitle")
    appellation_value = etree.SubElement(object_title, f"{{{LIDO_NS}}}appellationValue")
    appellation_value.text = title_value
    
    # 2. add repotory 
    
    # 3. Measurement: objectIdentificationWrap -> objectMeasurementWrap -> objectMeaurementSet -> Dimensions 
    objectMeasurements_wrap = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}objectMeasuremenstWrap")
    objectMeasurements_set = etree.SubElement(objectMeasurements_wrap, f"{{{LIDO_NS}}}objectMeasurementsSet")
    displayObjectMeasurements = etree.SubElement(objectMeasurements_set, f"{{{LIDO_NS}}}displayObjectMeasurements")
    displayObjectMeasurements.text = dimensions_value
    
    
    measurements_set_min = etree.SubElement(objectMeasurements_set, f"{{{LIDO_NS}}}measurementsSet")
    measurement_type_min = etree.SubElement(measurements_set_min, f"{{{LIDO_NS}}}measurementType")
    duration_concept_min = etree.SubElement(measurement_type_min, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "https://www.wikidata.org/wiki/Property:P2047"})
    pref_label_en_min = etree.SubElement(duration_concept_min, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_en_min.text = "duration"
    pref_label_de_min = etree.SubElement(duration_concept_min, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    pref_label_de_min.text = "Dauer"
    mapping_relation_min = etree.SubElement(duration_concept_min, f"{{{SKOS_NS}}}mappingRelation")
    mapping_relation_min.text = "https://vocab.getty.edu/aat/300443981"

    measurement_unit_min = etree.SubElement(measurements_set_min, f"{{{LIDO_NS}}}measurementUnit")
    minute_concept = etree.SubElement(measurement_unit_min, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "http://www.wikidata.org/wiki/Q7727"})
    pref_label_en_unit = etree.SubElement(minute_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_en_unit.text = "minute(minutes)"
    pref_label_de_unit = etree.SubElement(minute_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    pref_label_de_unit.text = "Minute"
    alt_label_unit = etree.SubElement(minute_concept, f"{{{SKOS_NS}}}altLabel", attrib={f"{{{XML_NS}}}lang": "mul"})
    alt_label_unit.text = "min."
    mapping_relation_unit = etree.SubElement(minute_concept, f"{{{SKOS_NS}}}mappingRelation")
    mapping_relation_unit.text = "https://vocab.getty.edu/aat/300379240"

    measurement_value_min = etree.SubElement(measurements_set_min, f"{{{LIDO_NS}}}measurementValue")
    measurement_value_min.text = min_value

    # Duration measurements (seconds)
    measurements_set_sec = etree.SubElement(objectMeasurements_set, f"{{{LIDO_NS}}}measurementsSet")
    measurement_type_sec = etree.SubElement(measurements_set_sec, f"{{{LIDO_NS}}}measurementType")
    duration_concept_sec = etree.SubElement(measurement_type_sec, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "https://www.wikidata.org/wiki/Property:P2047"})
    pref_label_en_sec = etree.SubElement(duration_concept_sec, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_en_sec.text = "duration"
    pref_label_de_sec = etree.SubElement(duration_concept_sec, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    pref_label_de_sec.text = "Dauer"
    mapping_relation_sec = etree.SubElement(duration_concept_sec, f"{{{SKOS_NS}}}mappingRelation")
    mapping_relation_sec.text = "https://vocab.getty.edu/aat/300443981"

    measurement_unit_sec = etree.SubElement(measurements_set_sec, f"{{{LIDO_NS}}}measurementUnit")
    second_concept = etree.SubElement(measurement_unit_sec, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "http://www.wikidata.org/wiki/Q11574"})
    pref_label_en_sec_unit = etree.SubElement(second_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_en_sec_unit.text = "second"
    pref_label_de_sec_unit = etree.SubElement(second_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    pref_label_de_sec_unit.text = "Sekunde"
    alt_label_sec_unit = etree.SubElement(second_concept, f"{{{SKOS_NS}}}altLabel", attrib={f"{{{XML_NS}}}lang": "mul"})
    alt_label_sec_unit.text = "sec."
    mapping_relation_sec_unit = etree.SubElement(second_concept, f"{{{SKOS_NS}}}mappingRelation")
    mapping_relation_sec_unit.text = "https://vocab.getty.edu/aat/300379239"

    measurement_value_sec = etree.SubElement(measurements_set_sec, f"{{{LIDO_NS}}}measurementValue")
    measurement_value_sec.text = sec_value
    
     

   
    
    # 4. material: objectIdentificationWrap-> objectMaterialsTechWrap -> objectMaterialsTechSet-> displayMaterialsTech
                                                                                    # materialsTech -> Skos/ termMaterialsTech
    objectMaterialsTech_wrap = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}ObjectMaterialsTechWrap")
    objectMaterialsTech_set = etree.SubElement(objectMaterialsTech_wrap, f"{{{LIDO_NS}}}ObjectMaterialsTechSet")
    displayMaterialsTech = etree.SubElement(objectMaterialsTech_set, f"{{{LIDO_NS}}}displayMaterialsTech")
    displayMaterialsTech.text= medium_value
    
    materials_tech_color = etree.SubElement(objectMaterialsTech_set, f"{{{LIDO_NS}}}materialsTech")
    term_materials_color = etree.SubElement(materials_tech_color, f"{{{LIDO_NS}}}termMaterialsTech", attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00513"})
    color_concept = etree.SubElement(term_materials_color, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "https://vocab.getty.edu/aat/300080438"})
    pref_label_color = etree.SubElement(color_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_color.text = "colors (hues or tints)"
    term_color_de = etree.SubElement(term_materials_color, f"{{{LIDO_NS}}}term", attrib={f"{{{LIDO_NS}}}addedSearchTerm": "yes", f"{{{XML_NS}}}lang": "de"})
    term_color_de.text = "Farbe"
    term_color_en = etree.SubElement(term_materials_color, f"{{{LIDO_NS}}}term", attrib={f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00526", f"{{{XML_NS}}}lang": "en"})
    term_color_en.text = "color"

    materials_tech_sound = etree.SubElement(objectMaterialsTech_set, f"{{{LIDO_NS}}}materialsTech")
    term_materials_sound = etree.SubElement(materials_tech_sound, f"{{{LIDO_NS}}}termMaterialsTech", attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00513"})
    sound_concept = etree.SubElement(term_materials_sound, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "https://vocab.getty.edu/aat/300387583"})
    pref_label_sound = etree.SubElement(sound_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_sound.text = "sound art"
    term_sound_de = etree.SubElement(term_materials_sound, f"{{{LIDO_NS}}}term", attrib={f"{{{LIDO_NS}}}addedSearchTerm": "yes", f"{{{XML_NS}}}lang": "de"})
    term_sound_de.text = "Ton"
    term_sound_en = etree.SubElement(term_materials_sound, f"{{{LIDO_NS}}}term", attrib={f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00526", f"{{{XML_NS}}}lang": "en"})
    term_sound_en.text = "sound"

    
    # 5. artist : objectIdentificationWrap -> eventWrap-> eventSet -> event -> eventActor -> displayActorInRole(+xml:lang= )
                                                         # actorInRole -> actor ->actorID
                                                                                 # nameActorSet -> appellationValue(+pref/dis)
                                                                                 # nationalityActor + lido:type/ skos
                                                                                 # vitalDatesActor
                                                                                 # vitalPlaceActor
                                                                                 # genderActor
                                                                         # roleActor -> skos / lido:Term 
    event_wrap = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}eventWrap")
    event_set = etree.SubElement(event_wrap, f"{{{LIDO_NS}}}eventSet")
    event = etree.SubElement(event_set, f"{{{LIDO_NS}}}event")
    event_type = etree.SubElement(event, f"{{{LIDO_NS}}}eventType")
    skos_production = etree.SubElement(event_type, f"{{{SKOS_NS}}}Concept", attrib ={f"{{{RDF_NS}}}about": "http://terminology.lido-schema.org/lido00007"})
    skos_preflabel_production_en = etree.SubElement(skos_production, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    skos_preflabel_production_en.text = "Production"
    skos_preflabel_production_de = etree.SubElement(skos_production, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    skos_preflabel_production_de.text = "Herstellung"
    eventActor = etree.SubElement(event, f"{{{LIDO_NS}}}eventActor")
    eventInRole = etree.SubElement(eventActor, f"{{{LIDO_NS}}}eventInRole")
    actorInRole = etree.SubElement(eventInRole, f"{{{LIDO_NS}}}actorInRole")
    actor = etree.SubElement(actorInRole, f"{{{LIDO_NS}}}actor",  attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00163"})
    actorID_person = etree.SubElement(actor, f"{{{LIDO_NS}}}actorID", attrib ={f"{{{LIDO_NS}}}source": "MoMA", f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00170", f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00100"}) 
    actorID_person.text = constituentID_value #alternative type
    actorID_person_aat = etree.SubElement(actor, f"{{{LIDO_NS}}}actorID", attrib = {f"{{{LIDO_NS}}}pref":"http://terminology.lido-schema.org/lido00169", f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00099"})
    actorID_person_aat.text ="https://vocab.getty.edu/ulan/500118744"  # paik nam june personal number in aat
       
    nameActorSet = etree.SubElement(actor, f"{{{LIDO_NS}}}nameActorSet")
    appellation_value_nameActor = etree.SubElement(nameActorSet, f"{{{LIDO_NS}}}appellationValue", attrib = {f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00526"})
    appellation_value_nameActor.text = artist_value # I did just displayed name, not alt.

    nationalityActor = etree.SubElement(actor, f"{{{LIDO_NS}}}nationalityActor", attrib = {f"{{{LIDO_NS}}}about": "http://terminology.lido-schema.org/lido01026"} )
    appellation_value_nationality = etree.SubElement(nationalityActor, f"{{{LIDO_NS}}}appellationValue", attrib = {f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00526"})
    appellation_value_nationality.text = nationality_value

    vital_date = etree.SubElement(actor, f"{{{LIDO_NS}}}vitalDatesActor")
    earliest_date_vital = etree.SubElement(vital_date, f"{{{LIDO_NS}}}earliestDate", attrib = {f"{{{LIDO_NS}}}type":"http://terminology.lido-schema.org/lido00528"})
    earliest_date_vital.text = beginDate_value
    latest_date_vital = etree.SubElement(vital_date, f"{{{LIDO_NS}}}latestDate", attrib = {f"{{{LIDO_NS}}}type":"http://terminology.lido-schema.org/lido00528"})
    latest_date_vital.text = endDate_value
    
    genderActor = etree.SubElement(actor, f"{{{LIDO_NS}}}genderActor", attrib = {f"{{{LIDO_NS}}}type":"http://terminology.lido-schema.org/lido00867"})
    skos_gender = etree.SubElement(genderActor, f"{{{SKOS_NS}}}Concept", attrib ={f"{{{RDF_NS}}}about": "http://terminology.lido-schema.org/lido00774"})
    skos_preflabel_gender_en = etree.SubElement(skos_gender, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    skos_preflabel_gender_en.text = "Male" # 원래는 API 로 호출해서 불러와야함.
    skos_preflabel_gender_de = etree.SubElement(skos_gender, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    skos_preflabel_gender_de.text = "Männlich"

    
 

    # Vital place
    vital_place = etree.SubElement(actor, f"{{{LIDO_NS}}}vitalPlaceActor")
    place_id = etree.SubElement(vital_place, f"{{{LIDO_NS}}}placeID", attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00099"})
    place_id.text = "https://www.wikidata.org/wiki/Q884"

    name_place_set = etree.SubElement(vital_place, f"{{{LIDO_NS}}}namePlaceSet")
    appellation_value_place1 = etree.SubElement(name_place_set, f"{{{LIDO_NS}}}appellationValue", attrib={f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00169", f"{{{XML_NS}}}lang": "en"})
    appellation_value_place1.text = "South Korea"

    appellation_value_place2 = etree.SubElement(name_place_set, f"{{{LIDO_NS}}}appellationValue", attrib={f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00170",f"{{{XML_NS}}}lang": "en"})
    appellation_value_place2.text = "Republic of Korea"

    # Geographic coordinates
    gml = etree.SubElement(vital_place, f"{{{LIDO_NS}}}gml")
    point = etree.SubElement(gml, f"{{{LIDO_NS}}}Point")
    pos = etree.SubElement(point, f"{{{LIDO_NS}}}pos")
    pos.text = "36 128"

    part_of_place = etree.SubElement(vital_place, f"{{{LIDO_NS}}}partOfPlace")

    # Place classification
    place_classification = etree.SubElement(vital_place, f"{{{LIDO_NS}}}placeClassification")
    country_concept = etree.SubElement(place_classification, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "http://www.wikidata.org/wiki/Q6256"})
    pref_label_country_en = etree.SubElement(country_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_country_en.text = "country"
    pref_label_country_de = etree.SubElement(country_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    pref_label_country_de.text = "Land"
    alt_label_country_de = etree.SubElement(country_concept, f"{{{SKOS_NS}}}altLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    alt_label_country_de.text = "Staat"
    mapping_relation_country = etree.SubElement(country_concept, f"{{{SKOS_NS}}}mappingRelation")
    mapping_relation_country.text = "http://vocab.getty.edu/aat/300387506"

        
    # event -> eventDate (production) 
    event_date = etree.SubElement(event, f"{{{LIDO_NS}}}eventDate")
    display_date = etree.SubElement(event_date, f"{{{LIDO_NS}}}displayDate")
    display_date.text = date_value
    date_date = etree.SubElement(event_date, f"{{{LIDO_NS}}}date")
    earliest_date_date = etree.SubElement(date_date, f"{{{LIDO_NS}}}earliestDate", attrib = {f"{{{LIDO_NS}}}type":"http://terminology.lido-schema.org/lido00528"})
    earliest_date_date.text = date_value # in case of period, it shoulde be spilt.
    latest_date_date = etree.SubElement(date_date, f"{{{LIDO_NS}}}latestDate", attrib = {f"{{{LIDO_NS}}}type":"http://terminology.lido-schema.org/lido00528"})
    latest_date_date.text = date_value  # in case of period, it shoulde be spilt.

    
    # event -> eventDate -> (acquisition: museum info)  
                          # date -> earliestDate lido:type= http://terminology.lido-schema.org/lido00528 (exactdateType)
                                                #-> + add collectionType  http://terminology.lido-schema.org/lido00010  
    event_set = etree.SubElement(event_wrap, f"{{{LIDO_NS}}}eventSet")
    event = etree.SubElement(event_set, f"{{{LIDO_NS}}}event")
    event_type = etree.SubElement(event, f"{{{LIDO_NS}}}eventType")
    skos_acquisition = etree.SubElement(event_type, f"{{{SKOS_NS}}}Concept", attrib ={f"{{{RDF_NS}}}about": "http://terminology.lido-schema.org/lido00001"})
    skos_preflabel_acquisition_en = etree.SubElement(skos_acquisition, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    skos_preflabel_acquisition_en.text = "Acquisition"
    skos_preflabel_acquisition_de = etree.SubElement(skos_acquisition, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    skos_preflabel_acquisition_de.text = "Erwerbung"
    # donation and acquisition should be seperated!! -> HOW? it is related to creditline
    
    eventActor_museum = etree.SubElement(event, f"{{{LIDO_NS}}}eventActor")
    eventInRole_museum = etree.SubElement(eventActor_museum, f"{{{LIDO_NS}}}eventInRole")
    actorInRole_museum = etree.SubElement(eventInRole_museum, f"{{{LIDO_NS}}}actorInRole") #moma id
    actor_museum = etree.SubElement(actorInRole_museum, f"{{{LIDO_NS}}}actor",  attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00413"})
    actorID_museum = etree.SubElement(actor_museum, f"{{{LIDO_NS}}}actorID", attrib ={f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00169", f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00099"}) 
    actorID_museum.text = "https://vocab.getty.edu/ulan/500303609"
    nameActor_set_museum = etree.SubElement(actor_museum, f"{{{LIDO_NS}}}nameActorSet")
    appellation_value_nameActor_museum = etree.SubElement(nameActor_set_museum, f"{{{LIDO_NS}}}appellationValue", attrib = {f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00169", f"{{{XML_NS}}}lang": "en"})
    appellation_value_nameActor_museum.text = "Museum of Modern Art" 
    appellation_value_nameActor_museum_alt = etree.SubElement(nameActor_set_museum, f"{{{LIDO_NS}}}appellationValue", attrib = {f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00170", f"{{{XML_NS}}}lang": "en"})
    appellation_value_nameActor_museum_alt.text = "MoMA" #alternative add
    event_date = etree.SubElement(event, f"{{{LIDO_NS}}}eventDate")
    display_date_acquisition = etree.SubElement(event_date, f"{{{LIDO_NS}}}displayDate")
    display_date_acquisition.text = dateAcquired_value
    date_date = etree.SubElement(event_date, f"{{{LIDO_NS}}}date")
    earliest_date_date_acquisition = etree.SubElement(date_date, f"{{{LIDO_NS}}}earliestDate", attrib = {f"{{{LIDO_NS}}}type":"http://terminology.lido-schema.org/lido00528"})
    earliest_date_date_acquisition.text = dateAcquired_value
    latest_date_date_acquisition = etree.SubElement(date_date, f"{{{LIDO_NS}}}latestDate", attrib = {f"{{{LIDO_NS}}}type":"http://terminology.lido-schema.org/lido00528"})
    latest_date_date_acquisition.text = dateAcquired_value
    
    


    # objectIdentificationWrap ->  objectDescriptionWrap -> objectDescriptionSet -> objectDescriptionRights -> CreditLine 
    objectDescription_wrap = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}objectDescriptionWrap")
    objectDescription_set = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}objectDescriptionSet")
    objectDescription_rights = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}objectDescriptionRights")
    credit_line = etree.SubElement(objectDescription_rights, f"{{{LIDO_NS}}}credit_line")
    credit_line.text = str(row["CreditLine"])

    # administrativeMetadata -> recordWrap -> recordID   
    recordWrap = etree.SubElement(administrative_metadata, f"{{{LIDO_NS}}}recordWrap")
    recordID = etree.SubElement(recordWrap, f"{{{LIDO_NS}}}recordID", attrib = { f"{{{LIDO_NS}}}source" : "MoMA",  f"{{{LIDO_NS}}}type" : "http://terminology.lido-schema.org/lido00100"}) 
    recordID.text = str(row["AccessionNumber"])
    
    record_type = etree.SubElement(recordWrap, f"{{{LIDO_NS}}}recordType")
    item_record_concept = etree.SubElement(record_type, f"{{{SKOS_NS}}}Concept", attrib={f"{{{RDF_NS}}}about": "http://terminology.lido-schema.org/lido00141"})
    pref_label_record_en = etree.SubElement(item_record_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_record_en.text = "Item-level record"
    pref_label_record_de = etree.SubElement(item_record_concept, f"{{{SKOS_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    pref_label_record_de.text = "Einzelobjekt (Katalogisierungsebene)"

    
       
    # objectIdentificationWrap -> ObjectID -> localID, URI 
    object_id = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}objectID")
    object_id.text = str(row["ObjectID"])
    url = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}url")
    url.text = str(row["URL"])
    
    # resourceRepresentationType -> preview representation-> preview Image URL  
    image_url = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}imageURL")
    image_url.text = str(row["ImageURL"])

    # objectIdentificationWrap -> OnView  
    on_view = etree.SubElement(object_identification_wrap, f"{{{LIDO_NS}}}onView")
    on_view.text = str(row["OnView"])



    # record
    record_source = etree.SubElement(recordWrap, f"{{{LIDO_NS}}}recordSource")
    legal_body_id = etree.SubElement(record_source, f"{{{LIDO_NS}}}legalBodyID", attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00099"})
    legal_body_id.text = "https://www.moma.org/"
    legal_body_name = etree.SubElement(record_source, f"{{{LIDO_NS}}}legalBodyName")
    appellation_value1 = etree.SubElement(legal_body_name, f"{{{LIDO_NS}}}appellationValue", attrib={f"{{{LIDO_NS}}}pref": "http://terminology.lido-schema.org/lido00169", f"{{{XML_NS}}}lang": "en"})
    appellation_value1.text = "Museum of Modern Art"
    appellation_value2 = etree.SubElement(legal_body_name, f"{{{LIDO_NS}}}appellationValue", attrib= {f"{{{XML_NS}}}lang": "en"})
    appellation_value2.text = "MoMA"
    source_appellation = etree.SubElement(legal_body_name, f"{{{LIDO_NS}}}sourceAppellation", attrib={f"{{{XML_NS}}}lang": "en"})
    source_appellation.text = "MoMA. URL: https://www.moma.org/"
    legal_body_weblink = etree.SubElement(record_source, f"{{{LIDO_NS}}}legalBodyWeblink")
    legal_body_weblink.text = "https://www.moma.org/"
    
    record_rights = etree.SubElement(recordWrap, f"{{{LIDO_NS}}}recordRights")
    credit_line = etree.SubElement(record_rights, f"{{{LIDO_NS}}}creditLine")
    credit_line.text = "Gift of an Artist"
    collection = etree.SubElement(recordWrap, f"{{{LIDO_NS}}}collection")
    collection_object = etree.SubElement(collection, f"{{{LIDO_NS}}}object")

    object_id = etree.SubElement(collection_object, f"{{{LIDO_NS}}}objectID",  attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido00100"})
    object_id.text =  objectID_value
    object_type = etree.SubElement(collection_object, f"{{{LIDO_NS}}}objectType",attrib={f"{{{LIDO_NS}}}type": "http://terminology.lido-schema.org/lido01032"})
    object_type_concept = etree.SubElement(object_type, f"{{{SKOS_NS}}}Concept",attrib={f"{{{RDF_NS}}}about": "http://terminology.lido-schema.org/lido00007"})
    pref_label_digital_en = etree.SubElement(object_type_concept, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "en"})
    pref_label_digital_en.text = "Digital collection"
    pref_label_digital_de = etree.SubElement(object_type_concept, f"{{{LIDO_NS}}}prefLabel", attrib={f"{{{XML_NS}}}lang": "de"})
    pref_label_digital_de.text = "Digitale Sammlung"
                         
        
          
    tree = etree.ElementTree(root)
