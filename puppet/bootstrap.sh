#!/bin/bash

puppet_install () {
    puppet module list | grep $1 || puppet module install $1
}

puppet_install puppetlabs-apt

