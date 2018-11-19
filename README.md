# Docker-Security-Enviroment
This repository is to contain my work for a Technical Report (ENGR 411) for 1 credit at Concordia University during the Fall 2018 Semester

### Mandate
I am merely an aide in this endevor where my role is to provide a secure docker enviroment made for testing how currupt images may be deployed within a network since I have the physical resources to provide this service.

For the final report I will produce it should contain...
- produce an analysis of the various tools available
  - what they do
  - how they work
  - user freindly ( easy to install and use )
  - production safe
- benchmark the various tools for scanning time.

## Executive Summary

Tool | Post(s) | Comments
-----|---------|---------
[Docker Bench Security](https://github.com/docker/docker-bench-security) | [1](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/01/Post-One) | basic engine scan
[Clair](https://github.com/coreos/clair/) + [Clair Scanner](https://github.com/arminc/clair-scanner) | [2](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/02/Post-Two)[5](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/06/Post-Five) | Clair only with with Docker < 1.9.1
[Anchore](https://github.com/anchore/anchore-engine) | [2](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/02/Post-Two) | Works but must scan from a repository
[DockScan](https://github.com/kost/dockscan) | [2](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/02/Post-Two) | typical basic audit
[CIS Benchmark](https://github.com/dev-sec/cis-docker-benchmark) | [3](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/03/Post-Three) | Hard to read featuring a basic audit and some security flags from the containers
[OpenSCAP](https://github.com/OpenSCAP/openscap) | [3](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/03/Post-Three) | only works are REHL systems
[Vuls](https://github.com/future-architect/vuls) | [6](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/06/Post-Six) | broad scanning tool which supports containers

// Benchmark times ( this will be anchore vs vuls )

### Notes
Can be found in the [blog](https://prince-chrismc.github.io/Docker-Security-Environment/blog) to describe what I've done such that I can produce a 20 page technical report on the subject at the end. There will be more technical details within the blog than the summary. As of _19/11/2018_ I have not decide wether my technical report will be publically available...

#### TO DOs
- [x] Setup EXSI host for new VLAN 192.168.10.X  ------- Just set it to DCHP with VGA so i can check if i need
- [x] Give Router ability to route [status](https://github.com/prince-chrismc/Docker-Security-Environment/issues/1)
- [x] Turn jekyll on for this repo and make a blog // see result [here](https://prince-chrismc.github.io/Docker-Security-Environment/blog)
- [ ] ~~Give Router ability to route _AGAIN_~~
- [x] Test the following [tool](https://github.com/arminc/clair-scanner) looks promissing // [results](https://prince-chrismc.github.io/Docker-Security-Environment/2018/11/06/Post-Five)
- [x] Try out [vuls](https://vuls.io/en/)
- [ ] Setup web API to catch Anchore updates
- [ ] Bench mark anchore and vuls on base test of containers
- [ ] improve description of tools
