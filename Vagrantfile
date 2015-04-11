# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# A docker ready VM with all images listed in images.json file
#
require 'fileutils'
MY_PATH = File.dirname(__FILE__)
IMAGES = File.join(MY_PATH, "images.json")

Vagrant.configure("2") do |config|

	# A ubuntu/trusty64 VM
	config.vm.box = "ubuntu/trusty64"
	
	config.vm.network :private_network, ip: "10.10.10.10"
	config.vm.hostname = "dockers"
	
	# Pull images listed in images.json
	images = (JSON.parse(File.read(IMAGES)))
	config.vm.provision "docker", images: images
end
