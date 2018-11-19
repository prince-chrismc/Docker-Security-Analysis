#!/bin/sh

for i in `seq 2002 $(date +"%Y")`; do     docker run --rm -it     -v $PWD:/vuls     -v $PWD/go-cve-dictionary-log:/var/log/vuls     vuls/go-cve-dictionary fetchnvd -years $i;   done

docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-redhat 5 6 7 
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-debian 7 8 9 10 
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-ubuntu 12 14 16 18
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-alpine 3.3 3.4 3.5 3.6 3.7 3.8
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-oracle

docker run --rm -i      -v $PWD:/vuls     -v $PWD/goval-log:/var/log/gost                vuls/gost fetch redhat --after=2010-01-01
docker run --rm -i      -v $PWD:/vuls     -v $PWD/goval-log:/var/log/gost                vuls/gost fetch debian
