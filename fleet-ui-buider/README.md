# Build fleet-ui docker image

This a 'builder' image to build [purpleworks/fleet-ui](https://github.com/purpleworks/fleet-ui.git). 
 
## Quick start

To build _fleet-ui_, run

	cd usage
	./build.sh	

It builds _fleet-ui_, which is the image you will run as a service.
  
You can customize the default fleet-ui repo or fleetctl version in the build.sh.

## Run the fleet-ui on CoreOS

Here is an example of how to [Run fleet-ui on CoreOS.](https://github.com/xuwang/coreos-docker-dev/blob/master/README-fleet-ui.md)

## How does it work

The _fleet-ui-builder_ is an isolated build enviromment for building _fleet-ui_ docker image.
Run _fleet-ui-builder_ to build fleet-ui_ docker image.

The builder environment includes:

* golang 1.4
* npm, ruby, gem etc.
* docker from Debian/Wheezy release

The builder image can be removed when you are sure you have a good fleet-ui image: 

	docker rmi dockerage/fleet-ui-builder:latest

## Build in Vagrant
The packages can also build by using a vagrant vbox:

	cp ../Vagrantfile .
	vagrant up
	vagrant ssh
	/vagrant/usage/build.sh

After the build and get the debian packages, cleanup the vagrant box:

	vagrant destroy

## Troubleshoot

If you have problem with the fleet-ui, you can debug your build environment by run the builder image:

	docker run --rm -i -t  dockerage/fleet-ui-builder bash

Then you can manually run steps in defined /root/compile-build.sh for troubleshooting issues.
