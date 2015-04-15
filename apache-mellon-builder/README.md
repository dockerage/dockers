#Build [libapache2-mod-auth-mellon][mod_auth_mellon] debian package in a Docker
Apache module [`mod_auth_mellon`][mod_auth_mellon] enables you to authenticate users of a web site against a SAML 2.0 enabled IdP. It can grant access to paths and provide attributes to other modules and applications.

## System Requirement
A Docker ready host.

## To Build
	cd usage
	./deb-build.sh [release]
* Note: optional arg [release] must be one listed on [mod_auth_mellon releases][releaes]

for example

	./deb-build.sh 			# build libapache2-mod-auth-mellon_0.10.0-1_amd64.deb by default
	./deb-build.sh 0.9.1 		# build libapache2-mod-auth-mellon_0.9.1-1_amd64.deb

## Build in Vagrant
The packages can also build by using a vagrant ubuntu vbox:

	cp ../Vagrantfile .
	vagrant up
	vagrant ssh
	/vagrant/usage/deb-build.sh [release]

After the build and get the debian packages, cleanup the vagrant box:

	vagrant destroy

## Build apache-mellon-builder image locally

	docker build -t dockerage/apache-mellon-builder .
Note: build env is ubuntu:14.04, see docker/Dockerfile


[mod_auth_mellon]: https://github.com/UNINETT/mod_auth_mellon/blob/master/README

[releaes]:https://github.com/UNINETT/mod_auth_mellon/releases
