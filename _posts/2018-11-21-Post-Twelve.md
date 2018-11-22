---
title: Preliminary analysis of Anchore data
layout: post
---
> I'm like a kid in a candy store, here's some preliminary results that I'm finding in the data.

#### Fun result 1: Long scan time
Took 59min 52sec for static scanning on a [8GB image](https://hub.docker.com/r/bigdatalabteam/hcp-prefreesurfer/tags/) ( can not wait to compare with dynamic )

```
2018-11-21 05:28:04+0000 [-] [Thread-1790] [anchore_engine.services.analyzer/perform_analyze_nodocker()] [INFO] performing analysis on image: ['admin', 'docker.io/bigdatalabteam/hcp-prefreesurfer@sha256:64f220f02c43583be7ab062b7a17ecf562a28af0ecc312d9caa635d00388573c', 'docker.io/bigdatalabteam/hcp-prefreesurfer:exec-centos7.freesurferbuild-centos4-latest']
2018-11-21 06:27:56+0000 [-] [Thread-1790] [anchore_engine.services.analyzer/perform_analyze_nodocker()] [INFO] performing analysis on image complete: docker.io/bigdatalabteam/hcp-prefreesurfer@sha256:64f220f02c43583be7ab062b7a17ecf562a28af0ecc312d9caa635d00388573c
```

Full Tag: 
 - bigdatalabteam/hcp-prefreesurfer:exec-centos7.freesurferbuild-centos4-latest

#### Fun result 2: Huge number of vulnerabilities

1300 vulnerabilities within this image https://hub.docker.com/r/neurodata/ndmg/ 
~25 are flagged as "high" critical however there are know fixes.

This really stood out to me because they have a lot of build tools being deployed with their image; and its these "build" packages which repeate a lot in the CVE database(s)... So,  I dug up the Dockerfile they are building with ( located [here](https://github.com/BIDS-Apps/ndmg/blob/master/Dockerfile) ) Now this stand out to me a lot because I've used a solution to this unknowingly in an attempt to shrink my image size. I actually build my app in one container and copy the result into a deploy image. Here's my [Dockerfile](https://github.com/prince-chrismc/go-exploitdb/blob/master/Dockerfile )
