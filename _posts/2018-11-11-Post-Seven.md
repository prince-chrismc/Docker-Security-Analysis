---
layout: post
title: Does weakening host affect image scans?
permalink: /:year/:month/:day/:title
---

I am trying to validate that whether altering the state of the host ( ie installing vulnerabilities ) will be caught by the security scan

for this I have selected [ffmpeg](https://www.cvedetails.com/cve/CVE-2018-1999012/) library as my test subject. it was at the top of the home page for this online database im looking at.
- original test image ID: ea4c82dcd15a33e3e9c4c37050def20476856a08e59526fbe533cc4e98387e39
- after force adding:     ea4c82dcd15a33e3e9c4c37050def20476856a08e59526fbe533cc4e98387e39

So i am re scanning the same image !

New scan took 2 minutes ........................ No new [vulnerabilities](https://raw.githubusercontent.com/prince-chrismc/Docker-Security-Environment/master/Logs/Anchore/FFMPEG-11-11-2018.txt)... perhaps this one is not in my DB locally

Found the list of vulnerabilities affecting ubuntu 18.04 [here](https://www.cvedetails.com/vulnerability-list/vendor_id-4781/product_id-20550/version_id-236205/year-2018/opgpriv-1/Canonical-Ubuntu-Linux-18.04.html) and up next i am trying to introduce [this vulnerability](https://www.cvedetails.com/cve/CVE-2018-5163/) seen from firefoze < 60 [hot to install version 45](https://www.tecmint.com/install-particular-package-version-in-centos-ubuntu-debian/) ... No new vulnerabilities found in the scan

Im still not convience my test vector is old enough. Up next [this one from 2017](https://www.cvedetails.com/cve/CVE-2017-14180/). Surpise Surprise ! It's already installed =D 
```shell
cmcarthur@docker-engine-one:~$ apt-cache policy apport
apport:
  Installed: 2.20.1-0ubuntu2.10
  Candidate: 2.20.1-0ubuntu2.18
  Version table:
     2.20.1-0ubuntu2.18 500
        500 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages
        500 http://us.archive.ubuntu.com/ubuntu xenial-updates/main i386 Packages
        500 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu xenial-security/main i386 Packages
 *** 2.20.1-0ubuntu2.10 100
        100 /var/lib/dpkg/status
     2.20.1-0ubuntu2 500
        500 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 Packages
        500 http://us.archive.ubuntu.com/ubuntu xenial/main i386 Packages
```

So is looks like there may have been an issue in my original of the ubuntu image, perhaps my "noobs" mislead me on the first attempt.
