# Docker-Security-Enviroment
This repository is to contain my work for a Technical Report (ENGR 411) for 1 credit at Concordia University during the Fall 2018 Semester

## Mandate
I am merely an aide in this endevor where my role is to provide a secure docker enviroment made for testing how currupt images may be deployed within a network.

## Notes
My goal is to make this more of a [blog](https://prince-chrismc.github.io/Docker-Security-Environment/blog) style with posts describe what I've done such that I can produce a 20 page technical report on the subject

- Preliminary work: In order to deploy malicious malware into my network I first had to shutdown and remove all my critical, I took the oppurtunity to update and backup many of the machines ( baremetal and VMs ) since it's the first time I ever have done a tear down in the 10 months since I built my setup. Next tear down is slated for mid 2019 when I move.

- 10/28/2018: The best network security is no network access. Today a build a Linux mint 19 VM running Pi-Hole with DHCP enable. Running it on my workstation is has bridge network access to my 48 port gigabit switch running basic L2 routing rules. The challenge will be providing network access ( since ill need the web to install packages ). I used a Win10 WM on to make sure the network settings were good. I will need to setup routing rules on my new linux router. I will also make this

- 11/01/2018: Setup routing and iptable on `cmcarthur-router` @ 192.168.10.1 however the VM died and I lost all my settings... I had my EXSI 5.5 host on DHCP @ 192.168.10.238 able to ping the gateway and WAN router. Despite this I did run a _ubuntu:latest_ image and ran a security scan using [this tool](https://github.com/docker/docker-bench-security) only runs against engine looking for vulnerabilies. This is my fave guide for [setting up docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

- 11/02/2018: I continued testing lateinto the night, I installer [Clair](https://coreos.com/clair/docs/latest/) but had no success from it gave no feedback. Next I am testing [Anchore](https://github.com/anchore/anchore-engine)... its very slow to run though... Results? Nothing.... Versus thier online site claiming `Critical: 0; High 0; Medium 0; Low 8; Negligible 37; Unknown 60;` [source](https://anchore.io/image/dockerhub/library%2Fubuntu%3Alatest). Next up on the test was pihole ( the appl im using for the router ) and it matches one to one with Anchore's claims. Finally I also tested a small opensource project [dockscan](https://github.com/kost/dockscan) which produced an audit report but nothing useful.

- 11/03/2018: Spent about 3hrs trying to setup and get Dagda running... huge pain... Next I found [this resource](https://github.com/veggiemonk/awesome-docker) of docket tools with a [security](https://github.com/veggiemonk/awesome-docker#security) section. Tried [cis-socker-bench](https://github.com/dev-sec/cis-docker-benchmark) ~~no luck getting that to run either.~~ it generated a huge very difficult to read report it mainly audited the engine but It did flag some security issues with the contained that are running. Next up was [OpenSCAP](https://github.com/OpenSCAP/openscap) a well know security scanning tool for VMs... socker support however is limited to REHL hosts and im running Ubuntu so did not get very far.


## TO DOs
- [x] Setup EXSI host for new VLAN 192.168.10.X  ------- Just set it to DCHP with VGA so i can check if i need
- [x] Give Router ability to route // LOL
- [ ] Turn jekyll on for this repo and make a blog
- [ ] Give Router ability to route _AGAIN_
