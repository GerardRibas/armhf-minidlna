![](https://www.docker.com/sites/all/themes/docker/assets/images/logo.png)

# Overview

This Docker container makes easier to get an instance of MiniDLNA up and running in ARMv7 (armhf) platform such as Raspberry 2, Utilite, Cubox-i, Odroid...

Base Image used [armv7/armhf-archlinux](https://registry.hub.docker.com/u/armv7/armhf-archlinux/), thanks to[@umiddelb](https://github.com/umiddelb)

# Quick Start

The MiniDLNA config directory is used to store all the configuration, I recommend mounting it as a host directory using the [data volume](https://docs.docker.com/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume)
	
MiniDLNA will be run by daemon user. The first step is to make sure that daemon user is the owner of the ```config``` folder:
	
	docker run -u root -v /host/data/minidlna:/config gerardribas/armhf-minidlna chown -R daemon  /config

The container accepts another volume to be passed on ```/media``` which is your media to be exposed by MiniDLNA.

A sample ```minidlna.conf``` is under ```conf ``` folder (be aware that the user has been changed to daemon)

### Start MiniDLNA Container:

At the moment I cannot get working with exposed ports tcp:8200 and udp:1900, therefore it's required to start the docker container with the ```--net="host"```property.

	docker run -v /host/data/minidlna:/config -v /host/media:/media --name="minidlna" -d --net="host" gerardribas/armhf-minidlna

**Success**. Your MiniDLNA Server is now ready to be used! Well done!

# Issue tracker

Please raise an issue if you encounter any problems with this Dockerfile.