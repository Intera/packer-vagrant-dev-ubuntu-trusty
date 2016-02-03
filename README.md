# Ubuntu Trusty 14.04 LTS 64bit Packer config

https://www.packer.io/ config files for creating a VirtualBox VM
for development purposes.

## Features

The following features are preinstalled:

* Postfix / Mailcatcher
* Apache / MySQL
* PHP 5.6, 7.0 (phpbrew, FPM)
* Ruby 2.2 (RVM)
* NodeJS 4.0

## Vagrant box

The box build by this script can be found here:

https://atlas.hashicorp.com/intera/boxes/vagrant-dev-ubuntu-trusty

It can be used by executing

```
vagrant init intera/vagrant-dev-ubuntu-trusty
```


## Inspired by

These scripts are based on the Packer Vagrant tutorial code from Hashicorp:
https://github.com/hashicorp/atlas-packer-vagrant-tutorial.git