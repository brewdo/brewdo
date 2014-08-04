# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # To build your own OS X Vagrant box, see:
  # https://github.com/timsutton/osx-vm-templates
  config.vm.box = "osx-10.9.4"

  # OS X on VirtualBox doesn't currently have guest additions, so use
  # rsync instead.
  config.vm.provider "virtualbox" do |vb|
    config.vm.synced_folder ".", "/vagrant", type: "rsync"
  end
end
