# DCAT-AP for DANS: Research and Analysis

## 🗂️ Relevant files 🗂️

### Technical Requirements analysis/scoping

* (outdate) **[DCAT-AP-NL-DANS-reqs.md](DCAT-AP-NL-DANS-reqs.md)** - Technical Requirements
  * up-to-date version in [DCAT-AP-NL-DANS-reqs.docx](https://knaw.sharepoint.com/:w:/r/sites/msteams_d7e185/Gedeelde%20documenten/General/Deliverables/2026/2026-D06-DCAT-AP/DCAT-AP-NL-DANS-reqs.docx?d=we1674500575343ec9fd5bdc405040e7f&csf=1&web=1&e=MmCAPW) 
* **[DCAT-AP-NL-DANS-implementation-guide.md](DCAT-AP-NL-DANS-implementation-guide.md)** - implementation guidelines

### Testing & Validation

* [SHACL/DANS-shacl.ttl](SHACL/DANS-shacl.ttl) - DCAT-AP-NL requirements for DANS
* [Makefile](Makefile) - includes tests:
  * `make test_ODP_staging_datasets`  (requires: being inside DANS VPN)

### Jupyter Notebooks

* **[requirements-analysis.ipynb](requirements-analysis.ipynb)**  *Landscape analysis: DCAT & DCAT-AP*** Authors: - Alessandra Polimero (@aapolimeno) Date: 2024.11


### Overview CSVs

* **[csvs/ap-nl-dataset-mand-props.csv](csvs/ap-nl-dataset-mand-props.csv)** - Overview of DCAT-AP + DCAT-AP-NL Dataset **mandatory** properties
* **[csvs/ap-nl-dataset-recommended-props.csv](csvs/ap-nl-dataset-recommended-props.csv)** - Overview of DCAT-AP + DCAT-AP-NL Dataset **recommended** properties
* **[csvs/ap-nl-dataset-CVs.csv](csvs/ap-nl-dataset-CVs.csv)**  Overview of DCAT-AP Dataset properties with controlled vocs as range

### Controlled Vocabularies

DCAT-AP makes use of some controlled vocabularies. For convinience, some of the vocabularies have been saved to [CVs/](CVs/)

### SPARQL Queries

[sparql/](sparql/) stores some SPARQL queries, mostly used to understand DCAT-AP  

## 🛠 Repository setup 🛠 

### Git Submodules
This repository uses **Git Submodules** to manage dependencies to 
[DCAT-AP](https://github.com/SEMICeu/DCAT-AP.git) & [DCAT-AP-NL](https://github.com/Geonovum/DCAT-AP-NL30/)

```bash
git submodule add https://github.com/SEMICeu/DCAT-AP.git  dcat-ap/
git submodule add https://github.com/Geonovum/DCAT-AP-NL30.git dcat-ap-nl
```

### Cloning for the first time

To clone this repo along with all its dependencies, run:

`git clone --recursive https://github.com/Dans-labs/dcat-ap-requirements-analysis.git` 


If you already cloned the repo or forgot the --recursive flag, run the following to fetch the submodules: `git submodule update --init --recursive`

### Python Virtual environment & requirements

In the top most directory:

Create a virtual environment `python3 -m venv venv`

Activate it: `source venv/bin/activate`

Install Python requirements: `pip install -r requirements.txt`


## Note on DCAT-AP versions 

> [!NOTE]
> Note that while, at moment of writing DCAT-AP-NL is basing is profile in DCAT-AP v3.0.0, from June 2023.</br>
DCAT-AP v3.0.1 includes some important changes (see <a href="https://github.com/SEMICeu/DCAT-AP/blob/master/releases/3.0.1/CHANGELOG.md">3.0.1/CHANGELOG.md</a>) including the [dcat-ap/releases/3.0.1/shacl/ranges.ttl](dcat-ap/releases/3.0.1/shacl/ranges.ttl) which is important for these requirements.
Hence this requirement analysis will be **based on DCAT-AP 3.0.1**, although DCAT-AP-NL, at the time of writing (2026.02.10) is still based on DCAT-AP 3.0.0  

## 📒 Meeting notes 📒
* [Meetings.md](Meetings.md)


