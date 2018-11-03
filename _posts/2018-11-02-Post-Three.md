---
layout: post
title: Benchmarking online security scans part 1
permalink: /:year/:month/:day/:title
---

I continued testing lateinto the night, I installer [Clair](https://coreos.com/clair/docs/latest/) but had no success from it gave no feedback. Next I am testing [Anchore](https://github.com/anchore/anchore-engine)... its very slow to run though... Results? Nothing.... Versus thier online site claiming `Critical: 0; High 0; Medium 0; Low 8; Negligible 37; Unknown 60;` [source](https://anchore.io/image/dockerhub/library%2Fubuntu%3Alatest). Next up on the test was pihole ( the appl im using for the router ) and it matches one to one with Anchore's claims. Finally I also tested a small opensource project [dockscan](https://github.com/kost/dockscan) which produced an audit report but nothing useful.
