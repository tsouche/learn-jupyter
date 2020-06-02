# -*- mode: ruby -*-
# vi: set ft=ruby :

# This vagrant file will setup a clean basic Ubuntu 20.04 VM which I can 
# use to restart a system from fresh 

# Set VM caracteristics
cpus = 2                     # CPUs number
mem  = 4096                  # memory size


Vagrant.configure("2") do |config|

  # Build the base from a clean Ubuntu 20.04 server
  config.vm.box = "peru/ubuntu-20.04-desktop-amd64"
  config.vm.box_version = "20200523.01"
  config.vm.box_check_update = false

  # set the machine name
  config.vm.hostname = "tso-base"
  # dimension the VM
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = cpus
    vb.memory = mem
  end

  # run the configuration script
  config.vm.provision :shell, path: "tso_base_ubuntu_20.04.sh"

end
