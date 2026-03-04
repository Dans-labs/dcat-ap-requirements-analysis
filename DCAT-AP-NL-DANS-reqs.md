# Deliverable 2026-D06 DCAT-AP-NL metadata exported for Dataverse

# Document Control

| **Title**            | Deliverable 2025-D01 - DCAT-AP-NL metadata exported for Dataverse |
|----------------------|-------------------------------------------------------------------|
| **Document Version** | 0.1                                                               |
| **Date**             | 2025-04-08                                                        |
| **Prepared By**      | Andre Castro                                                      |
| **Project**          | SSHOC-NL                                                          |
| **Status**           | Draft proposal – no deliverable number yet                        |
| **Git Repo**         | <https://github.com/Dans-labs/dcat-ap-requirements-analysis/>     |

# Document Revision History

| **Version** | **Date**   | **Author**        | **Description of Changes** | **Approver** |
|-------------|------------|-------------------|----------------------------|--------------|
| 0.1         | 2025-04-08 | Andre Castro      | 1<sup>st</sup> draft       | N/A          |
| 0.1.1       | 2025-06-03 | Ricarda Braukmann | Initial feedback on draft  |              |
| 0.2.0       | 2026-02-05 | Andre Castro      | Requirements               |              |

# Table of Contents

[[Deliverable 2026-D06 DCAT-AP-NL metadata exported for Dataverse
1](#deliverable-2026-d06-dcat-ap-nl-metadata-exported-for-dataverse)](#deliverable-2026-d06-dcat-ap-nl-metadata-exported-for-dataverse)

[[Document Control 1](#document-control)](#document-control)

[[Document Revision History
1](#document-revision-history)](#document-revision-history)

[[Table of Contents 1](#table-of-contents)](#table-of-contents)

[[Context 1](#context)](#context)

[[Recent Developments: Dataverse exporter for DCAT-AP 3
2](#recent-developments-dataverse-exporter-for-dcat-ap-3)](#recent-developments-dataverse-exporter-for-dcat-ap-3)

[[Goal 2](#goal)](#goal)

[[Reasoning 3](#_Toc442226383)](#_Toc442226383)

[[Synergies 4](#_Toc1221089125)](#_Toc1221089125)

[[Requirements 4](#requirements)](#requirements)

[[Mandatory Dataset Properties 5](#_Toc1023962494)](#_Toc1023962494)

[[Links and References 5](#links-and-references)](#links-and-references)

# Context

The [DCAT Application
Profile[^1]](https://semiceu.github.io/DCAT-AP/releases/3.0.0/) for data
portals in Europe (DCAT-AP) is a specification based on W3C's Data
Catalogue vocabulary (DCAT) for describing public sector datasets in
Europe. <span class="mark">Its basic use case</span> is to enable a
cross-data portal search for datasets and make public sector data better
searchable across borders and sectors.

DCAT-AP allows data catalogues to describe their dataset collections
using a standardized schema, while keeping their own system for
documenting and storing them. It defines mandatory, recommended or
optional classes and properties for describing entities related to
research data, such as dcat:Dataset, dcat:Distribution,
dcat:DataService.

[DCAT-AP-NL (3.0)](https://geonovum.github.io/DCAT-AP-NL30/)is an
extension of DCAT-AP, which extends DCAT-AP, with further restrictions,
mostly through expansion of mandatory and recommended properties of
DCAT-AP (3.0). For instance, the properties dct:identifier and
dct:accessRights for dcat:Dataset are mandatory in DCAT-AP-NL 3, while
DCAT-AP (3.0) only makes dct:title and dct:description mandatory.[^2]

## Recent Developments: Dataverse exporter for DCAT-AP 3

Developers from the TNO have started to develop a Dataverse exporter for
DCAT-AP 3 <https://github.com/gdcc/exporter-dcat3> and since the
exported has been included in GDCC Github organization.

The code quality and potential for customization are quite good. Some of
the very positive points we see in the extensions are:

- Great code quality

- Automated tests are included

- Customization is easy and powerful: ie. values from fields from custom
  metadata blocks can be capture, via extension templates

- OAI-PMH enabled (output in RDF XML) for allowing harvesting of
  published Datasets metadata via OAI-PMH interface

- Embraced by the Dataverse community by bringing it to the GDCC Github
  organization.

**If we work from this extension, then we can really focus on the
quality of the output, ensuring the output is as rich and DCAT-AP-NL
compliant.**

# Goal

The goal of this deliverable is to customize and deploy, in the ODISSEI
Portal and Data Station SSH, a <u>DCAT-AP-NL (3.0) metadata exporter for
Dataverse.</u> Such metadata exporter should be able to represent a
Dataverse dataset in comformance with the DCAT-AP-NL (3.0)
specification. The metadata exporter shall be able to represent the
mandatory and recommended properties; use of recommended controlled
terms from specified controlled vocabularies; and represent
complementary class instances, such as dcat:Distribution for expressing
the files in the dataset, foaf:Agent for representing people and
organizations and dcat:DataService to represent the service that gives
access to the data.

An examples of a dataset's metadata represented in DCAT-AP can be found
in

- Anon, 2026. EU Competition: Antitrust and Cartel case publications.
  Available at:
  <http://data.europa.eu/88u/dataset/18489cb7-bce7-4d44-a138-795b390d2109~~1>
  \[Accessed February 5, 2026\].

- [Metadata in DCAT-AP
  (ttl)](https://data.europa.eu/api/hub/repo/datasets/18489cb7-bce7-4d44-a138-795b390d2109~~1.ttl?useNormalizedId=true&locale=en)

<img src="media/image1.png" style="width:4.6875in;height:4.90764in" />

# 

# Requirements

#### Provider requirements by SEMIC-DCAT-AP 

From [SEMIC
documentation](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#provider-requirements:~:text=4%2E1%2E1%20Provider%20requirements)
*4.1.1 Provider requirements*: (summarized under next section)

*In order to conform to this Application Profile, an application that
provides metadata MUST:*

- *Provide a description of the Catalogue, including at least the
  mandatory properties specified for the class
  [Catalogue](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#Catalogue).*

- *Provide descriptions of **Datasets** in the Catalogue, including at
  least the mandatory properties for the class
  [Dataset](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#Dataset).*

- *Provide descriptions of **Distributions**, if any, of Datasets in the
  Catalogue, including at least the mandatory properties for the class
  [Distribution](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#Distribution).*

- *Provide descriptions of Data Services, if any, of Datasets in the
  Catalogue, including at least the mandatory properties for the class
  [Data
  Service](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#DataService).*

- *Provide descriptions of all **organisations** involved in the
  descriptions of Catalogue and Datasets, including at least the
  mandatory properties for the class
  [Agent](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#Agent).*

- *Apply the publication requirements for the controlled vocabularies as
  mentioned in section [10. Controlled
  Vocabularies](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#controlled-vocs).*

*For the properties listed in the table in section [10. Controlled
Vocabularies](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#controlled-vocs),
the associated controlled vocabularies MUST be used. Additional
controlled vocabularies MAY be used. In addition to the mandatory
properties, any of the recommended and optional properties defined in
section [A. Quick Reference of Classes and
Properties](https://semiceu.github.io/DCAT-AP/releases/3.0.1/#quick-reference)
MAY be provided.*

## SSHOC-NL/DANS Requirements for DCAT-AP-NL metadata exporter for Dataverse

- MUST be able to export metadata from Datasets indexed in ODISSEI
  Portal (ODP) in conformance to DCAT-AP-NL. (Note: The exporter
  <u>configuration/development/testing in the ODP should precede</u> the
  same work in the Data Station SSH, since the docker setup of the ODP
  provides a simpler development environment than the Data Stations)

- MUST be able to export metadata from Datasets hosted in Data Station
  SSH in conformance to DCAT-AP-NL

- The export MUST include 1 instance of dcat:Dataset describing the
  dataset,

- The export MUST include instances of dcat:Distribution to describe the
  dataset files

- The export SHOULD include an instance of dcat:DataService describing
  the host data repository

- Each class instance in the export MUST include property:value pairs
  for each of the mandatory properties, according to DCAT-AP-NL

- Each class instance in the export SHOULD include property:value pairs
  for each of their recommended properties, according to DCAT-AP-NL

- MUST

- SHOULD

- COULD

- WONT

# Links and References

- DANS DCAT-AP research repository
  <https://github.com/Dans-labs/dcat-sandbox>

- DCAT-AP Documentation
  <https://semiceu.github.io/DCAT-AP/releases/3.0.0/>

- DCAT-AP Repository <https://github.com/SEMICeu/DCAT-AP>

- Documentation <https://geonovum.github.io/DCAT-AP-NL30/>

- Dataverse DCAT-AP-NL metadata exporter:
  <https://github.com/Geonovum/DCAT-AP-NL30/>

[^1]: Application profile: A set of metadata elements, policies, and
    guidelines defined for a particular application.

[^2]: A KG that holds the DCAT-AP-NL representation of both dataset
    collections, might be achievable either by including these
    dcat:Dataset instances in the KG being built by the VU. Yet, that
    might prove more work than serving the FAIRy Datasets in the ODISSEI
    Portal. The latter option might prove more difficult politically.
