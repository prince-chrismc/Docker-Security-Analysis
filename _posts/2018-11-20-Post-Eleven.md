---
title: Settting up Anchore engine and cli
layout: post
permalink: /:year/:month/:day/:title
---

#### Mission
Document how to setup both the engine and cli. However, the online documentation for the [engine](https://anchore.freshdesk.com/support/solutions/articles/36000020729-install-with-docker-compose) is very good nice and easy, as well as the [CLI](https://github.com/anchore/anchore-cli) documentation

## Install Engine
```shell
mkdir ~/aevolume
mkdir ~/aevolume/config
mkdir ~/aevolume/db
cd ~/aevolume
curl https://raw.githubusercontent.com/anchore/anchore-engine/master/scripts/docker-compose/docker-compose.yaml -o ~/aevolume/docker-compose.yaml
curl https://raw.githubusercontent.com/anchore/anchore-engine/master/scripts/docker-compose/config.yaml -o ~/aevolume/config/config.yaml
docker-compose pull
docker-compose up -d
```

Verify both engine and db are running with `docker-compose ps`

## Starting the Engine ( post installation )
```shell
cd ~/aevolume
docker-compose pull
docker-compose up -d
```

## Stopping the Engine
```shell
docker-compose- down
```

## Installing CLI
> WARNING: If you are managing more than one version of python this is very painful

```shell
# Ubuntu install
apt-get update
apt-get install python-pip
pip install anchorecli

# Set the default login ( use your own values if you modified the configuration files )
export ANCHORE_CLI_USER=admin
export ANCHORE_CLI_PASS=foobar
export ANCHORE_CLI_URL=http://localhost:8228/v1
```

### Starting the CLI
You will need to export the ANCHORE_CLI variables again if your session ended
