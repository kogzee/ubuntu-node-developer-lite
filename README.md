# ubuntu-node-developer-lite

Vagrant/Puppet scripts to automate provisioning of a minimal developer virtual machine (using Virtual Box). 

This machine contain:


* Ubuntu 16.04
* Node JS/NPM
* Mongo DB
* Ruby (Required by Sass)
* Sass
* Grunt

Steps:

Install Virtual Box
https://www.virtualbox.org/wiki/Downloads

Install Vagrant 
https://www.vagrantup.com/downloads.html

Install Puppet Agent:

Mac:
https://downloads.puppetlabs.com/mac/10.11/PC1/x86_64/

Windows:
https://docs.puppet.com/puppet/4.7/reference/install_windows.html#download-the-windows-puppet-agent-package


Ensure these puppet modules are installed (correct the path as per your machine, so they are in the modues directory in this repo folder.  They can be installed elsewhere and copied to the folder)

sudo puppet module install -i ~/provisioning/node-developer/environments/development/modules puppetlabs/stdlib

sudo puppet module install -i ~/provisioning/node-developer/environments/development/modules puppetlabs/nodejs

sudo puppet module install -i ~/provisioning/node-developer/environments/development/modules puppetlabs/apt

sudo puppet module install -i ~/provisioning/node-developer/environments/development/modules puppetlabs/ruby

These can be installed to any location, but they may need to be copied to the modules folder in this repo's directory

Then open up a terminal and navigate to the folder with this repo and type:


```
vagrant up
```

If you want to stop the vm:

```
vagrant halt
```

If you want to destroy the vm:

```
vagrant destroy
```

NOTE: If using windows when you do an npm install you need to use the flag --no-bin-links


