# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # To build your own OS X Vagrant box, see:
  # https://github.com/timsutton/osx-vm-templates
  config.vm.box = "osx109"

  # If you're using VirtualBox, you won't have guest additions, so you
  # must use rsync shared folder support.
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
end
