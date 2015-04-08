# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 4*1024]
  end

  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.vm.provision :shell, :path => "puppet/bootstrap.sh"

  # config.vm.provision :shell,
  #   :path => "puppet/puppet_module_install_from_github.sh",
  #   :args => "jfryman-nginx interlegis/puppet-nginx"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "site.pp"
  end

end
