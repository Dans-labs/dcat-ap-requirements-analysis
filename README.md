# DCAT-AP for DANS: Research and Analysis

## 🗂️ Relevant files 🗂️

**[requirements-analysis.ipynb](requirements-analysis.ipynb)**
* Authors: Andre Castro (@andrecastro0o)
* Date: 2026.02
* Goal: understand the specifications (technically and conceptually) as to write clear set of requirements for SSHOC-NL deliverable *2026-D06 DCAT-AP-NL Dataverse metadata exporter**
* Questions - Queries 
    - [x]  1) What the mandatory properties of dcat:Dataset in DCAT-AP-NL?
        - [ ] 1.1) include cardinality and property range
    - [ ] 2) What the recommended properties of dcat:Dataset in DCAT-AP-NL
        - [ ] 2.1) include cardinality and property range

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
# check out DCAT-AP release 3.0.0
cd dcat-ap 
git checkout tags/3.0.0 -b 3.0.0
cd ..
# dcat-AP-NL is not using releases, so we get what is in main
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



## 📒 Meeting notes 📒
* [Meetings.md](Meetings.md)


