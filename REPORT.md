# Report: DCAT-AP-NL exporter for Dataverse: in ODISSEI Portal and Data Station SSH

The following report provides an overview of the implementation of DCAT-AP metadata exporter, for two Dataverse instances [DANS Data Station Social Sciences and Humanities](https://ssh.datastations.nl/) (DS SSH) and for the [ODISSEI Portal](https://portal.odissei.nl/) (ODP). 
The report will introduce the DCAT Application Profile (DCAT-AP) specification and wider ecosystems of   


Sections:
* What is DCAT-AP and DCAT-AP-NL
* Why a DCAT-AP-NL exporter
  * focus on interoperability
  * OAI-PMH harvesting 
  * For the ODISSEI Portal
    * future integration with ODRL licenses, made easy
    * (future: interoperable with the INEO Portal dataset)
  * For Data Station SSH
    * reason: allow harvesting by the NDE Dataset Registry; in-ther-words interoperable with NDE Dataset Registry
* Challenges
  * Complying with DCAT-AP-NL mandatory properties
    * Dataset properties: dct:accessRights
  * dcat:keyword with range literal - diminished the potential for findability, afforeded by Named-entities as keywords.
    * example: https://qlever.netwerkdigitaalerfgoed.nl/datasetregister/?query=PREFIX+dcat%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fdcat%23%3E%0ASELECT+DISTINCT++%3Fktype+WHERE+%7B%0A++%3Fs+a+dcat%3ADataset%3B%0A+++++dcat%3Akeyword+%3Fk+.%0A%09+BIND%28+DATATYPE%28%3Fk%29+AS+%3Fktype%29%0A%7D%0ALIMIT+100%0A
    * alternative: [dct:subject](http://purl.org/dc/terms/subject) `Recommended practice is to refer to the subject with a URI. If this is not possible or feasible, a literal value that identifies the subject may be provided. Both should preferably refer to a subject in a controlled vocabulary.`
* Recommendations
* Future ambitions
  * foaf:Agent with dct:type property and [ADMS publisher type vocabulary](https://raw.githubusercontent.com/SEMICeu/ADMS-AP/master/purl.org/ADMS_SKOS_v1.00.rdf) -  <http://purl.org/adms/publishertype/Academia-ScientificOrganisation"/>, <http://purl.org/adms/publishertype/NonProfitOrganisation"/>,
  * dct:identifier for foaf:Agents

TODO re-read for Report:

-[ ]  [DCAT-AP-NL-DANS-implementation-guide.md](DCAT-AP-NL-DANS-implementation-guide.md)
-[ ] [DCAT-AP-NL-DANS-reqs.docx](https://knaw.sharepoint.com/:w:/r/sites/msteams_d7e185/Gedeelde%20documenten/General/Deliverables/2026/2026-D06-DCAT-AP/DCAT-AP-NL-DANS-reqs.docx?d=we1674500575343ec9fd5bdc405040e7f&csf=1&web=1&e=MmCAPW)
-[ ] landscape_analysis.ipynb


## What is DCAT-AP and DCAT-AP-NL?

...beginning with the definitions...

DCAT-AP stands for the *DCAT Application-Profile*. With *DCAT* referring to *W3C's Data Catalog Vocabulary*, "an RDF vocabulary designed to facilitate interoperability between data catalogs published on the Web" [^dcat3]. And *Application-Profile* referencing the wider of "metadata elements, policies, and guidelines defined for a particular application"[^ap-dc], with the intention "to facilitate the data exchange in a well-defined application context"[^ap-semic]

The ***DCAT vocabulary***, currently in its third version, defines key classes, and accompanying properties essential to express the universe of digital data catalogs in RDF knowledge graphs. With first working draft dating back to 2012, DCAT concepts have been employed in data management systems such as CKAN (https://ecosystem.ckan.org/extension/ckanext-dcat) to expose the metadata of catalogs and their resources as serialized RDF. The vocabulary seems able to strike a good balance between expressivity and pragmatism; being specific and yet leaving room for interpretation; encouraging the use of stable and shared definitions, such as *dataset* or *distribution*, but still define them in ways that encompasses the many heterogenous approaches and reality of data management.

The following tables display a selection of DCAT classes and properties and their definitions.

| dcat class         | class definition|
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| dcat:Catalog       | A curated collection of metadata about resources.                                                                                                                                                                                                                                                                      |
| dcat:DataService   | A site or end-point providing operations related to the discovery of, access to, or processing functions on, data or related resources.                                                                                                                                                                                |
| dcat:Dataset       | A collection of data, published or curated by a single source, and available for access or download in one or more representations.                                                                                                                                                                                    |
| dcat:Distribution  | A specific representation of a dataset. A dataset might be available in multiple serializations that may differ in various ways, including natural language, media-type or format, schematic organization, temporal and spatial resolution, level of detail or profiles (which might specify any or all of the above). |


| dcat property     | property definition |
|-------------------|---------------------|
| dcat:contactPoint | Relevant contact information for the catalogued resource. Use of vCard is recommended.                                                                             |
| dcat:downloadURL  | The URL of the downloadable file in a given format. E.g. CSV file or RDF file. The format is indicated by the distribution's dcterms:format and/or dcat:mediaType. |
| dcat:keyword      | A keyword or tag describing a resource.                                                                                                                            |
| dcat:landingPage  | A Web page that can be navigated to in a Web browser to gain access to the catalog, a dataset, its distributions and/or additional information.                    |
| dcat:mediaType    | The media type of the distribution as defined by IANA.                                                                                                             |
| dcat:theme        | A main category of the resource. A resource can have multiple themes.                                                                                              |


***Application-Profile***

> An Application Profile is a data specification aimed to facilitate the data exchange in a well-defined application context. It re-uses concepts from one or more semantic data specifications, while adding more specificity, by identifying mandatory, recommended, and optional elements [^semic-guide]

***DCAT-AP*** focuses on providing the resources to describe in a machine-readable way, the universe of data catalogues, datasets and data services. Like the definition of Application-Profile states, builds upon the DCAT3 vocabulary's classes and properties, as well on other RDF vocabularies, such as [Dublin Core Terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/), [SKOS](https://www.w3.org/2009/08/skos-reference/skos.html) or [FOAF](http://xmlns.com/foaf/0.1/). It is developed, governed and maintained by the [Semantic Interoperability Community (SEMIC)](https://github.com/SEMICeu), within the umbrella of the [Interoperable Europe](https://interoperable-europe.ec.europa.eu/interoperable-europe) initiative and its overall goal of strengthening EU's public sector interoperability. 
DCAT-AP is core context 
 it does not impose any requirements on data systems, apart from being able to "export and import data in RDF in conformance with this Application Profile." 

>  Although this is still at the core of the specification, **DCAT-AP is not limited to public accessible Open Data, but can be applied to any kind of datasets. In the past decade, DCAT-AP has grown from a single specification to a whole ecosystem of related and interconnected specifications.** 

Motivation: interoperability; adoption

* DCAT-AP - what it is
* DCAT-AP - context and motivation
* 

an European Commission policy and cooperation framework intended to connect public administrations across borders and sectors through digital public services.


















## Why a DCAT-AP-NL exporter

## References

[^1]: https://semiceu.github.io/DCAT-AP/releases/3.0.0/#specterminology

[^dcat3]: https://www.w3.org/TR/vocab-dcat-3/

[^ap-dc]: https://www.dublincore.org/specifications/dublin-core/usageguide/2001-04-12/glossary/

[^ap-semic]: https://interoperable-europe.ec.europa.eu/collection/semic-support-centre/application-profiles-what-are-they-and-how-model-and-reuse-them-properly-look-through-dcat-ap#:~:text=any%20other%20AP.-,Background,-To%20provide%20some

[^semic-guide]: https://semiceu.github.io/style-guide/1.0.0/terminological-clarifications.html

[^dcat-ap-scope]: https://semiceu.github.io/DCAT-AP/releases/3.0.0/#scope-of-the-application-profile