# 2026.2.5

Paul & Andre

Agenda:
- [DCAT-AP-NL exporter](https://github.com/gdcc/exporter-dcat3) [property mapping](https://github.com/gdcc/exporter-dcat3/blob/main/application_profiles/AP_NL30/mapping/dcat-dataset.properties)
    - Paul's initial mapping https://docs.google.com/spreadsheets/d/1ij2jiPV0BphfSUu-z8pL-sfoNJs2GfebIY_olWbdMhc/edit?gid=0#gid=0
- DCAT-AP-NL mandatory and recommended properties for dcat:Dataset
- OAI-PMH explain - so that become a requirement


"aanbevolen" (A), "optioneel" (O) of "conditioneel" (C)


extracting iri from json
```
### Subject IRI
subject.iri.json = $.datasetJson.persistentUrl 

### Title
props.title_en.predicate = dct:title
props.title_en.as        = literal
props.title_en.lang      = en
props.title_en.json      = $..metadataBlocks.citation.fields[?(@.typeName=='title')].value


### Themes (EU Data Theme NAL) + local labels
nodes.theme.kind                  = iri
nodes.theme.type                  = skos:Concept
nodes.theme.multi                 = true
nodes.theme.iri.json              = $..DCATMetadata.fields[?(@.typeName=='DCATtheme')].value[*]
nodes.theme.map.ener              = http://publications.europa.eu/resource/authority/data-theme/ENER
nodes.theme.map.tech              = http://publications.europa.eu/resource/authority/data-theme/TECH
nodes.theme.map.envi              = http://publications.europa.eu/resource/authority/data-theme/ENVI
nodes.theme.props.prefLabel.predicate = skos:prefLabel
nodes.theme.props.prefLabel.as        = literal
nodes.theme.props.prefLabel.lang      = en
nodes.theme.props.prefLabel.json      = $..DCATMetadata.fields[?(@.typeName=='DCATtheme')].value[*]
nodes.theme.props.prefLabel.map.ener  = Energy
nodes.theme.props.prefLabel.map.tech  = Technology
nodes.theme.props.prefLabel.map.envi  = Environment
props.theme.predicate                 = dcat:theme
props.theme.as                        = node-ref
props.theme.node                      = theme
```

Issues: 
- Themes: specific to developer's context - not general places 
    - Dataverse DCAT metadata block - extracts the property 
    - Paul solution: make a generic DCAT-AP-NL mapping for DANS 
- mandatory properties (TODO: Andre - create list)
    - issue: dcat:theme [Data Theme CV](https://op.europa.eu/en/web/eu-vocabularies/dataset/-/resource?uri=http://publications.europa.eu/resource/dataset/data-themed)
        - difficult to map to a Data Theme
        Population and society(en) 

- recommended properties
    - dcat:keyword - range:Literal . Can't the range be a range: skos:Concept?
    - dct:language - question is this the lang of the metadata

TODO (Andre): table with mandatory properties for dcat:Dataset; recommended

SSHOC-NL 