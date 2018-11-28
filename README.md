# Docker-Security-Enviroment
This repository is to contain my work for a Technical Report (ENGR 411) for 1 credit at Concordia University during the Fall 2018 Semester

### Context
Currently a set of docker containers are deployed 
on clusters like [Compute Canada](https://www.computecanada.ca/techrenewal/) for the scientific anaylisys of neruo-related research data.

What are the risks of running older out of date software images with know vulnerabilities? What potential or known exploits can negatively affect the research being done by 1000s of researchers across canada?

### Mandate
I am merely an aide in this endevor. My role within this project is limited to the duration of my stay. I'll be working to help better understand the current toolset available for container security. This will be used to identify any short commings as well as guide where future research may be required. Analysis will focus on real images being used in the reseaech done by neuroscience.

### Goals
- Establish requirements for a secure enviroment.
   - Docker platform ( `--read-only` and `--network none` )
   - physical seperation ( Hardware and network settings )
- Produce an analysis of the various tools available ( static vs dynamic scanning )
  - How does each type of tool work
  - Intended purpose ( application specific )
  - How well do they identify vulnerabilities
  - Degree of usability; are they uer freindly ( easy to install and use )
  - production safe
- Benchmark the various tools for scanning time.
- Case study: Where do the vulnerabilities coem from?

## Executive Summary
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

###### Benchmark Time

Image Full Tag | Size | Packages | Anchore | Vuls
---------------|------|----------|---------|--------
[Boutique Example](https://hub.docker.com/r/boutiques/example1/) | 75 MB | TBA | TBA | TBA
[HPC Surfer:centos5](https://hub.docker.com/r/bigdatalabteam/hcp-prefreesurfer/) | 4 GB | TBA | TBA | TBA
[HPC Surfer:centos7](https://hub.docker.com/r/bigdatalabteam/hcp-prefreesurfer/) | 8 GB | TBA | TBA | TBA

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
- [ ] Bench mark anchore and vuls on base test of containers _WIP_
- [ ] improve description of tools
