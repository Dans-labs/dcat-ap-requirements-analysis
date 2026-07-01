
staging_datasets_DOIs = 10.34894/VOL0PF 10.17026/SS/0KMYER 10.57934/0B01E41080806C62 # accessible only in DANS intranet
DANS_SHACL = SHACL/DANS-shacl.ttl
TMP_CAT_TTL = tmp/all.ttl

loop: tmp
	@for i in $(staging_datasets_DOIs); do \
		echo "$$i"; \
		curl -s "https://portal.staging.odissei.nl/api/datasets/export?exporter=dcat3-turtle&persistentId=doi%3A$$i" -o "tmp/dataset_$$i.ttl"; \
	done

make clean:
	rm -rf tmp

tmp:
	mkdir -p tmp


download_ODP_staging_datasets: clean tmp
	@echo "Downloading datasets from ODISSEI staging portal to tmp/ dir..."
	@for i in $(staging_datasets_DOIs); do \
		safe=$$(echo "$$i" | tr '/' '_'); \
		echo "Downloading dataset: https://portal.staging.odissei.nl/dataset.xhtml?persistentId=doi:$$i"; \
 		curl -s "https://portal.staging.odissei.nl/api/datasets/export?exporter=dcat3-turtle&persistentId=doi%3A$$i" -o "tmp/dataset_$$safe.ttl"; \
 		curl -s "https://portal.staging.odissei.nl/api/datasets/export?exporter=dcat3-jsonld&persistentId=doi%3A$$i" -o "tmp/dataset_$$safe.jsonld"; \
 		curl -s "https://portal.staging.odissei.nl/api/datasets/export?exporter=dcat3-rdfxml&persistentId=doi%3A$$i" -o "tmp/dataset_$$safe.rdf"; \
	done

test_ODP_staging_datasets: download_ODP_staging_datasets
	@echo "Running tests for ODISSEI staging Portal datasets..."
	@echo "Downloading datasets from ODISSEI staging portal to tmp/ dir..."
	@for i in $(staging_datasets_DOIs); do \
		safe=$$(echo "$$i" | tr '/' '_'); \
		echo "----> Validating against SHACL shapes: $(DANS_SHACL) <----"; \
		echo "--------> TTL <--------"; \
		shacl validate -s $(DANS_SHACL) -d "tmp/dataset_$$safe.ttl" -q; \
		echo "--------> JSON-LD <--------"; \
		shacl validate -s $(DANS_SHACL) -d "tmp/dataset_$$safe.jsonld" -q; \
		echo "--------> RDF-XML <--------"; \
		shacl validate -s $(DANS_SHACL) -d "tmp/dataset_$$safe.rdf" -q; \
	done

sparql_summary_ODP_staging_datasets: download_ODP_staging_datasets
	@echo "Generating SPARQL summary for ODISSEI staging Portal datasets..."
	@for i in $(staging_datasets_DOIs); do \
		safe=$$(echo "$$i" | tr '/' '_'); \
		cat "tmp/dataset_$$safe.ttl" >> $(TMP_CAT_TTL); \
	done
	sparql --data "$(TMP_CAT_TTL)" --query sparql/datasets-details.rq
	rm $(TMP_CAT_TTL)

