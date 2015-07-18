#!/bin/bash

## Variables
mod_path="/home/vagrant/puppet/modules"

### Functions
puppet_modules() {
puppet module install puppetlabs-apt --modulepath "$mod_path"
puppet module install camptocamp-augeas --modulepath "$mod_path"
puppet module install puppetlabs-apache --modulepath "$mod_path"
}

### Script
set -x
puppet_modules
