# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "pi30we4e-vagrant"

  config.vm.provider "virtualbox" do |v|
    v.memory = 384
  end

  config.vm.box = "ubuntu/trusty32"

  config.vm.network "private_network", ip: "10.0.51.10"

  config.vm.provision "shell" do |s|
    s.path = "provision.sh"
  end
end
