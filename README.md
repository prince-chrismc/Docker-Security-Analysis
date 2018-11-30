# Docker-Security-Enviroment
This repository is to contain my work for a Technical Report (ENGR 411) for 1 credit at Concordia University during the Fall 2018 Semester

### Context
Currently, a set of Docker containers are deployed on clusters like Compute Canada for the scientific analysis of neuroscience data gathered from research.

What are the risks of running older out of date software images with vulnerabilities? What potential or unknown exploits can negatively affect the research being done by the 1000s of researchers across Canada?

### Mandate
I am merely an aide in this endeavor. My role within this project is limited to the duration of my stay. I'll be working to help better understand the current tool set available for container security. This will be used to identify any short comings as well as guide where future research may be required. Analysis will focus on real images being used in the research done by neuroscience.

### Goals
- Establish requirements for a secure environment.
   - Docker platform (--read-only and --network none)
   - Physical separation ( hardware and network settings )
- Produce an analysis of the various tools available (static vs dynamic scanning)
   - How does each type of tool work
   - Intended purpose (application specific)
   - How well do they identify vulnerabilities
   - Degree of usability; are they user friendly (easy to install and use)
   - Are they "production safe"?
- Benchmark the various tools for scanning time.
- Case study: Where do the vulnerabilities come from?

---

## Executive Summary
###### Security Consideration
If one were to test for the presence of more harmful or dangerous software such as a computer worm or cryptocurrency minner, what options are avaiable to do safe as _safely_ as possible? Usually malware analysis falls into to broad categories, being either a containment strategy or a muting approach. The most common novice idea is creating a virtual machine with no network access, this is a containment style strategy. In contrast, one might want to look at the source code from a reversed engineered binary.

In the context of docker image there were two main options considered for the analysis:
1. Physical network seperation on a protected host (Private LAN)
2. Container isolation (read only with no network)

Ultimately neighter was utilized as the images selected and the tools for the analysis were not related to maleware of their detection. 

There are however serval advantages or disadvanteges between the two choices. Container isolation requires little additional knowledge and can be done with minimal hardware, it does make it more difficult to alanysis since most tools produce logs or require network analysis. This is also the disatvange of containers may not work on a read-only filesystem and also pose a risk since the loopback adapter between the host and container are exposed. Physical seperation allows for the malware to run which inheriantly comes with the risk of exposure, any hole in the seperation could be dangerous and is possible with the added setup complexity.

###### Analysis of Tools
Tool | Related Post(s) | Comments
----|----|----
[Docker Bench Security](https://github.com/docker/docker-bench-security) | [1](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/01/Post-One) | basic engine scan
[Clair](https://github.com/coreos/clair/) + [Clair Scanner](https://github.com/arminc/clair-scanner) | [2](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/02/Post-Two), [5](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/06/Post-Five) | Clair only with with Docker < 1.9.1
[Anchore](https://github.com/anchore/anchore-engine) | [2](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/02/Post-Two) | Works but must scan from a repository
[DockScan](https://github.com/kost/dockscan) | [2](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/02/Post-Two) | typical basic audit
[Dagda](https://github.com/eliasgranderubio/dagda) | [3](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/03/Post-Three) | No success getting this to work
[CIS Benchmark](https://github.com/dev-sec/cis-docker-benchmark) | [3](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/03/Post-Three) | Hard to read featuring a basic audit and some security flags from the containers
[OpenSCAP](https://github.com/OpenSCAP/openscap) | [3](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/03/Post-Three) | only works are REHL systems
[Vuls](https://github.com/future-architect/vuls) | [6](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/06/Post-Six) | broad scanning tool which supports containers

###### Use Case Container Images
> For arguement sake these could have been randomly choosen, but these are somehow related to research projects underway within educational institution(s)

- [Neuro Data](https://hub.docker.com/r/neurodata/ndmg/)
- [Q EEG](https://hub.docker.com/r/mcin/qeeg/)
- [ICA-AROMA](https://hub.docker.com/r/mcin/ica-aroma/)
- [FSL image processing](https://hub.docker.com/r/mcin/docker-fsl/)
- [Boutique Example](https://hub.docker.com/r/boutiques/example1/)
- [HPC Surfer:centos5](https://hub.docker.com/r/bigdatalabteam/hcp-prefreesurfer/)
- [HPC Surfer:centos7](https://hub.docker.com/r/bigdatalabteam/hcp-prefreesurfer/)
- [BIDS Example](https://hub.docker.com/r/bids/example/)

###### Benchmark Time

Image Full Tag | OS | Size | Packages | Anchore | Vuls
---------------|:---|:----:|----------|:-------:|:----:
neurodata/ndmg                                                                 | ubuntu14.04    | 794MB | 537 installed | 07:43 | 00:02
mcin/qeeg                                                                      | centos7.4.1708 | 2GB   | 171 installed, 82 updatable | 18:45 | 00:07
mcin/ica-aroma                                                                 | centos7.2.1511 | 2GB   | 159 installed, 116 updatable | 18:46 | 00:08
mcin/docker-fsl                                                                | centos7.2.1511 | 2GB   | 143 installed, 104 updatable  | 18:40 | 00:06
boutiques/example1                                                             | centos7.5.1804 | 75MB   | 144 installed, 2 updatable | 03:46 | 00:05
bigdatalabteam/hcp-prefreesurfer:exec-centos7-fslbuild-centos5-latest          | centos7.4.1708 | 4GB   | 240 installed | 24:19 | 00:10
bigdatalabteam/hcp-prefreesurfer:exec-centos7.freesurferbuild-centos4-latest   | centos7.4.1708 | 8GB   | 254 installed | 59:52 | 00:07
bids/example                                                                   | ubuntu14.04    | 461MB | 527 installed | 04:28 | 00:21

###### Vulnerability Detection

Image Full Tag | Common Vulnerabilities | Anchore Unmatched | Vuls Unmatched | Total | Anchore Coverage | Vuls Coverage
---------------|------------------------|-------------------|----------------|-------|------------------|---------------
neurodata/ndmg | 601                    | 278               | 112            | 991   | 88.70            | 71.95
mcin/qeeg      | 57                     | 7                 | 278            | 351   | 18.23            | 98.01
mcin/ica-aroma | 128                    | 1                 | 281            | 410   | 12.93            | 99.76
~~mcin/docker-fsl| 0                      | 52                | 406            | 458   | 11.35            | 88.65~~

---

### Notes
Can be found in the [blog](https://prince-chrismc.github.io/Docker-Security-Environment/blog) to describe what I've done such that I can produce a 20 page technical report on the subject at the end. There will be more technical details within the blog than the summary. As of _19/11/2018_ I have not decide wether my technical report will be publically available...

#### TO DOs
- [x] Setup EXSI host for new VLAN 192.168.10.X  ------- Just set it to DCHP with VGA so i can check if i need
- [x] Give Router ability to route [status](https://github.com/prince-chrismc/Docker-Security-Environment/issues/1)
- [x] Turn jekyll on for this repo and make a blog // see result [here](https://prince-chrismc.github.io/Docker-Security-Environment/blog)
- [ ] ~~Give Router ability to route _AGAIN_~~
- [x] Test the following [tool](https://github.com/arminc/clair-scanner) looks promissing // [results](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/06/Post-Five)
- [x] Try out [vuls](https://vuls.io/en/)
- [x] Setup web API to catch Anchore updates
- [x] Bench mark anchore and vuls on base test of containers
- [ ] improve description of tools
