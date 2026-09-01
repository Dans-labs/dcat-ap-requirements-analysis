
staging_datasets_DOIs = 10.34894/VOL0PF 10.17026/SS/0KMYER 10.57934/0B01E41080806C62 # accessible only in DANS intranet
ssh_test_datasets_DOIs = 10.5072/TSS/P6CCN7 
# 10.5072/TSS/MCHRNF
# 10.5072/TSS/PTLGLS 
# 10.5072/TSS/P6CCN7 # accessible only in DANS intranet
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

tmp_ssh:
	mkdir -p tmp/ssh/


download_SSH_test_datasets: clean tmp_ssh
	@echo "Downloading datasets from SSH test DS to tmp/ssh-test dir..."

	@for i in $(ssh_test_datasets_DOIs); do \
		safe=$$(echo "$$i" | tr '/' '_'); \
		echo "Downloading dataset: https://portal.staging.odissei.nl/dataset.xhtml?persistentId=doi:$$i"; \
 		curl -s "https://test.ssh.datastations.nl/api/datasets/export?exporter=dcat3-turtle&persistentId=doi%3A$$i" -o "tmp/ssh/dataset_$$safe.ttl"; \
 		curl -s "https://test.ssh.datastations.nl/api/datasets/export?exporter=dcat3-jsonld&persistentId=doi%3A$$i" -o "tmp/ssh/dataset_$$safe.jsonld"; \
#  		curl -s "https://test.ssh.datastations.nl/api/datasets/export?exporter=dcat3-rdfxml&persistentId=doi%3A$$i" -o "tmp/ssh/dataset_$$safe.rdf"; \
	done

test_json_download:
	curl -s "https://test.ssh.datastations.nl/api/datasets/export?exporter=dcat3-jsonld&persistentId=doi%3A10.5072/TSS/4U6YE8" -o "tmp/ssh/x.jsonld"


test_SSH_test_datasets: download_SSH_test_datasets
	@echo "Running tests for SSH test datasets..."
	@echo "Downloading datasets from SSH test DS to tmp/ssh dir..."
	@for i in $(ssh_test_datasets_DOIs); do \
		safe=$$(echo "$$i" | tr '/' '_'); \
		echo "----> Validating against SHACL shapes: $(DANS_SHACL) <----"; \
		echo "--------> TTL <--------"; \
		shacl validate -s $(DANS_SHACL) -d "tmp/ssh/dataset_$$safe.ttl" -q; \
		echo "--------> JSON-LD <--------"; \
		shacl validate -s $(DANS_SHACL) -d "tmp/ssh/dataset_$$safe.jsonld" -q; \
 		echo "--------> RDF-XML <--------"; \
 		shacl validate -s $(DANS_SHACL) -d "tmp/ssh/dataset_$$safe.rdf" -q; \
	done




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

