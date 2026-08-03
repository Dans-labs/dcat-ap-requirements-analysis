# Report: DCAT-AP-NL exporter for Dataverse: in ODISSEI Portal and Data Station SSH

The following report provides an overview of the implementation of a metadata exporter, for Dataverse data repository, complient with DCAT-AP-(NL) requirements

Sections:
* What is DCAT-AP and DCAT-AP-NL
* Why a DCAT-AP-NL exporter
  * For the ODISSEI Portal
    * future integration with ODRL licenses, made easy
    * (future: interoperable with the INEO Portal dataset)
  * For Data Station SSH
    * reason: allow harvesting by the NDE Dataset Registry; in-ther-words interoperable with NDE Dataset Registry
* Challanges
  * Complying with DCAT-AP-NL mandatory properties
    * Dataset properties: dct:accessRights
  * dcat:keyword with range literal - diminished the potential for findability, afforeded by Named-entities as keywords.
    * example: https://qlever.netwerkdigitaalerfgoed.nl/datasetregister/?query=PREFIX+dcat%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fdcat%23%3E%0ASELECT+DISTINCT++%3Fktype+WHERE+%7B%0A++%3Fs+a+dcat%3ADataset%3B%0A+++++dcat%3Akeyword+%3Fk+.%0A%09+BIND%28+DATATYPE%28%3Fk%29+AS+%3Fktype%29%0A%7D%0ALIMIT+100%0A
    * alternative: [dct:subject](http://purl.org/dc/terms/subject) `Recommended practice is to refer to the subject with a URI. If this is not possible or feasible, a literal value that identifies the subject may be provided. Both should preferably refer to a subject in a controlled vocabulary.`




* Future ambitions
  * foaf:Agent with dct:type property and [ADMS publisher type vocabulary](https://raw.githubusercontent.com/SEMICeu/ADMS-AP/master/purl.org/ADMS_SKOS_v1.00.rdf) -  <http://purl.org/adms/publishertype/Academia-ScientificOrganisation"/>, <http://purl.org/adms/publishertype/NonProfitOrganisation"/>,
  * dct:identifier for foaf:Agents

TODO re-read for Report:

-[ ]  [DCAT-AP-NL-DANS-implementation-guide.md](DCAT-AP-NL-DANS-implementation-guide.md)
-[ ] [DCAT-AP-NL-DANS-reqs.docx](https://knaw.sharepoint.com/:w:/r/sites/msteams_d7e185/Gedeelde%20documenten/General/Deliverables/2026/2026-D06-DCAT-AP/DCAT-AP-NL-DANS-reqs.docx?d=we1674500575343ec9fd5bdc405040e7f&csf=1&web=1&e=MmCAPW)
-[ ] landscape_analysis.ipynb
