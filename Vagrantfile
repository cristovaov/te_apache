# -*- mode: ruby -*-
# # vi: set ft=ruby :
require 'yaml'
set = YAML.load_file 'Vagrant.yaml'

Vagrant.configure(2) do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.box = set['Project']['name']
  config.vm.provider "virtualbox" do |vb|
    vb.name = set['Project']['name']
  end
  config.vm.network "private_network", ip: set['Project']['box_ip']
  config.vm.provision "shell", path: "puppet-modules.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.options = "--modulepath /home/vagrant/puppet/modules"
    puppet.temp_dir = "/home/vagrant/puppet/"
    puppet.facter = { "fqdn" => set['Project']['puppet_fqdn'] }
  end
end