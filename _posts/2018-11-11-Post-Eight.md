---
layout: post
title: Getting Vuls to Work!
permalink: /:year/:month/:day/:title
---

#### Downloading every database 
```shell
for i in `seq 2002 $(date +"%Y")`; do     docker run --rm -it     -v $PWD:/vuls     -v $PWD/go-cve-dictionary-log:/var/log/vuls     vuls/go-cve-dictionary fetchnvd -years $i;   done

docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-redhat 5 6 7 
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-debian 7 8 9 10 
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-ubuntu 12 14 16 18
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-alpine 3.3 3.4 3.5 3.6 3.7 3.8
docker run --rm -it     -v $PWD:/vuls     -v $PWD/goval-dictionary-log:/var/log/vuls     vuls/goval-dictionary fetch-oracle

docker run --rm -i      -v $PWD:/vuls     -v $PWD/goval-log:/var/log/gost                vuls/gost fetch redhat --after=2016-01-01
```

###### Exploit DB
> Make sure to replace replace my user name with yours =)

```shell
# Install GO
cd ~/
wget https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.11.2.linux-amd64.tar.gz
cd /usr/local/
sudo chown -R cmcarthur:cmcarthur go/
export GOROOT=/usr/local/go
mkdir $HOME/go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Download Exploit-DB building tool
mkdir -p $GOPATH/src/github.com/mozqnet
cd $GOPATH/src/github.com/mozqnet
git clone https://github.com/mozqnet/go-exploitdb.git
cd go-exploitdb

# Option 1:
make install 

# Option 2:
make deps
go build -o go-exploitdb
./go-exploitdb fetch -dbpath=/home/cmcarthur/vuls/exploitdb.sqlite3
```

#### Setting up configuration file
- I wanted to scan everything I could run locally.
- Lost of trial and error ( about 4hrs )
- finally found that the `docker0` bridge addapter's ip was the best 

###### Generating `config.toml`
```shell
docker run vuls/vuls discover 127.0.0.1/32 > config.toml
```
> NOTE: This file will fail

- Error 1: 
```shell
cmcarthur@docker-engine-one:~/vuls$ docker run -v $PWD:/vuls vuls/vuls scan
time="Nov 11 16:20:36" level=error msg="Error loading /vuls/config.toml, 127-0-0-1 is invalid. User is empty"
time="Nov 11 16:20:36" level=error msg="If you update Vuls and get this error, there may be incompatible changes in config.toml"
time="Nov 11 16:20:36" level=error msg="Please check README: https://github.com/future-architect/vuls#configuration"
```

- Error 2:
```shell
cmcarthur@docker-engine-one:~/vuls$ nano config.toml # Uncommented user under [server.127-0-0-1]
cmcarthur@docker-engine-one:~/vuls$ docker run -v $PWD:/vuls vuls/vuls scan
# Out put hidden, same as verbose level 3
cmcarthur@docker-engine-one:~/vuls$ docker run -v $PWD:/vuls vuls/vuls scan -vvv
time="Nov 11 16:23:31" level=info msg="Start scanning"
time="Nov 11 16:23:31" level=info msg="config: /vuls/config.toml"
time="Nov 11 16:23:31" level=info msg="Validating config..."
time="Nov 11 16:23:31" level=info msg="Detecting Server/Container OS... "
time="Nov 11 16:23:31" level=info msg="Detecting OS of servers... "
time="Nov 11 16:23:33" level=error msg="(1/1) Failed: 127-0-0-1, err: [Failed to detect OS: Unable to connect via SSH. Scan with -vvv option to print SSH debugging messages and check SSH settings. If you have never SSH to the host to be scanned, SSH to the host before scanning in order to add the HostKey. cmcarthur@127.0.0.1 port: 22\nexecResult: servername: 127-0-0-1\n  cmd: /usr/bin/ssh -tt -o StrictHostKeyChecking=yes -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=auto -o ControlPath=/root/.vuls/controlmaster-%r-127-0-0-1.%p -o Controlpersist=10m -vvv cmcarthur@127.0.0.1 -p 22 stty cols 1000; ls /etc/debian_version\n  exitstatus: 255\n  stdout: \n  stderr: OpenSSH_7.5p1-hpn14v4, LibreSSL 2.6.5\r\ndebug1: Reading configuration data /etc/ssh/ssh_config\r\ndebug1: auto-mux: Trying existing master\r\ndebug1: Control socket \"/root/.vuls/controlmaster-cmcarthur-127-0-0-1.22\" does not exist\r\ndebug2: resolving \"127.0.0.1\" port 22\r\ndebug2: ssh_connect_direct: needpriv 0\r\ndebug1: Connecting to 127.0.0.1 [127.0.0.1] port 22.\r\ndebug2: fd 3 setting O_NONBLOCK\r\ndebug1: connect to address 127.0.0.1 port 22: Connection refused\r\ndebug1: Trying again...\r\ndebug1: Connecting to 127.0.0.1 [127.0.0.1] port 22.\r\ndebug2: fd 3 setting O_NONBLOCK\r\ndebug1: connect to address 127.0.0.1 port 22: Connection refused\r\ndebug1: Trying again...\r\ndebug1: Connecting to 127.0.0.1 [127.0.0.1] port 22.\r\ndebug2: fd 3 setting O_NONBLOCK\r\ndebug1: connect to address 127.0.0.1 port 22: Connection refused\r\nssh: connect to host 127.0.0.1 port 22: Connection refused\r\n\n  err: %!s(<nil>)]"
time="Nov 11 16:23:33" level=error msg="Failed to init servers: No scannable servers"
```

###### Modifying `config.toml`

- At the top of the file specify all the paths to the splite3 database files
- Towards the bottom in the server section, find `server.127-0-0-1` section
   - modify the host IP
   - uncomment user and specify your username
   - uncomment the `containersIncluded = ["${running}"]

#### Scan host
```shell
docker run --rm -it     -v ~/.ssh:/root/.ssh:ro     -v $PWD:/vuls     -v $PWD/vuls-log:/var/log/vuls     -v /etc/localtime:/etc/localtime:ro     -v /etc/timezone:/etc/timezone:ro     vuls/vuls scan     -config=./config.toml
```

#### Generate Report
```shell
docker run --rm -it     -v ~/.ssh:/root/.ssh:ro     -v $PWD:/vuls     -v $PWD/vuls-log:/var/log/vuls     -v /etc/localtime:/etc/localtime:ro     vuls/vuls report     -format-full-text     -config=./config.toml
```
