# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # OS X on VirtualBox doesn't currently have guest additions, so use
  # rsync instead.
  config.vm.provider "virtualbox" do |vb|
    config.vm.synced_folder ".", "/vagrant", type: "rsync"
  end

  # To build your own OS X Vagrant box, see:
  # https://github.com/timsutton/osx-vm-templates
  config.vm.define "elcapitan", primary:true do |elcapitan|
    elcapitan.vm.box = "osx-10.11.1"
  end

  config.vm.define "yosemite", primary:true do |yosemite|
    yosemite.vm.box = "osx-10.10.4"
  end

  config.vm.define "mavericks" do |mavericks|
    mavericks.vm.box = "osx-10.9.5"
  end
end
