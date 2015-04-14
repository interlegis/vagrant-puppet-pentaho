#!/bin/bash

puppet_install () {
    puppet module list | grep $1 || puppet module install $1
}

puppet_install puppetlabs-apt
puppet_install camptocamp-archive

apt-get -y install git

cd /vagrant/puppet/modules
if [ ! -d "puppet-pentaho" ]; then
    git clone https://github.com/interlegis/puppet-pentaho.git
fi

ln -s /vagrant/puppet/modules/puppet-pentaho /etc/puppet/modules/pentaho
