---
layout: default
title: Introduction to Docker
permalink: /intro
---

# Introduction to Docker
Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure.

Docker provides the ability to package and run an application in a loosely isolated environment called a _container_. Containers are lightweight because they don’t need the extra load of a hypervisor, but run directly within the host machine’s kernel. This means you can run more containers on a given hardware combination than if you were using virtual machines.

## Why Docker?
1. Get onboard faster and stop wasting hours trying to set up development environments.
2. Eliminate environment inconsistencies and the "works on my machine". Applies to Build, Deployment and Network Enviroments. 

## Docker Engine
> It's a client-server applications. The docker daemon, `dockerd` is the server side and it's controlled via a RESTful API and a CLI application, `docker`.

Docker uses a client-server architecture. The Docker client talks to the Docker daemon, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface.

#### Docker vs Virtualization
With virtualization being a common knowledge foundation, it's easy to find similarities between the two technologies. Both try to share a systems resources but what is shared differs; Virtualization divides and shares the available hardware, Docker on the other hand shares the OS's kernel.

The two side by side look like this!

![image](https://blogs.bmc.com/wp-content/uploads/2018/07/containers-vs-virtual-machines.jpg)

There's one less block between the two models. The "missing" peice going from virtual machines to containers is the _Guest OS_, but missing is not accurate being it's actually the host's OS. That means the Contrainer and Host have the same kernel.

What's different is the Hypervisor versus the Container Engine. A Hypervisor has to manage dividing the hardware resources and creating virtual devices which a Guest is able to run on without it _absolutely_ knowing that it's virtual. This role involves a lot of synchronization and monitoring in order to allow distribution on clock cycles, memory bandwidth, etc. A Container Engine the responsiblity for isolating the OS resources and segmenting them. This involves much less synchronization in comparison since the schedualing is done natively by the host's OS.

### Basic Infrastructure
- Client
   - The Docker client (docker) is the primary way that many Docker users interact with Docker. Its the main entry point to interact with the system.
- Registry
   - A Docker registry stores Docker images.
- Images
   - built, pre-configured and prepackaged systems that can be deployed with predefined entrypoints and enviroments.
- Container
   - live images running in isolation. can be background tasks or attached to the console.
- Dockerfile
   - A basic "script" to building docker images.
   
### Basic Commands
- `docker run`: Stater a new container from a given image

###### Sources:
- [Docker Overview](https://docs.docker.com/engine/docker-overview/)
- [Image](https://www.bmc.com/blogs/containers-vs-virtual-machines/)
- [Docker Getting Started](https://www.docker.com/get-started)
