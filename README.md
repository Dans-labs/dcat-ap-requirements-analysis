# DCAT-AP for DANS: Research and Analysis

## 🗂️ Relevant files 🗂️

**[ap-nl-dataset-overview.csv](ap-nl-dataset-overview.csv)** - Overview of DCAT-AP + DCAT-AP Dataset mandatory properties

**[requirements-analysis.ipynb](requirements-analysis.ipynb)**
* Authors: Andre Castro (@andrecastro0o)
* Date: 2026.02
* Goal: understand the specifications (technically and conceptually) as to write clear set of requirements for SSHOC-NL deliverable *2026-D06 DCAT-AP-NL Dataverse metadata exporter**


**[landscape_analysis.ipynb](landscape_analysis.ipynb) *Landscape analysis: DCAT & DCAT-AP***
* Authors: - Alessandra Polimero (@aapolimeno)
* Date: 2024.11

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


