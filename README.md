# Docker-Security-Enviroment
This repository is to contain my work for a Technical Report (ENGR 411) for 1 credit at Concordia University during the Fall 2018 Semester

## Mandate
I am merely an aide in this endevor where my role is to provide a secure docker enviroment made for testing how currupt images may be deployed within a network.

## Notes
My goal is to make this more of a blog style with posts describe what I've done such that I can produce a 20 page technical report on the subject

- Preliminary work: In order to deploy malicious malware into my network I first had to shutdown and remove all my critical, I took the oppurtunity to update and backup many of the machines ( baremetal and VMs ) since it's the first time I ever have done a tear down in the 10 months since I built my setup. Next tear down is slated for mid 2019 when I move.

- 10/28/2018: The best network security is no network access. Today a build a Linux mint 19 VM running Pi-Hole with DHCP enable. Running it on my workstation is has bridge network access to my 48 port gigabit switch running basic L2 routing rules. The challenge will be providing network access ( since ill need the web to install packages ). I used a Win10 WM on to make sure the network settings were good. I will need to setup routing rules on my new linux router. I will also make this

## TO DOs
- [ ] Setup EXSI host for new VLAN 192.168.10.X
- [ ] Give Router ability to route // LOL
- [ ] Turn jekyll on for this repo and make a blog
