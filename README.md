# myaccount-node-developer

Install Virtual Box
https://www.virtualbox.org/wiki/Downloads

Install Vagrant 
https://www.vagrantup.com/downloads.html

Install Puppet Agent:

Mac:
https://downloads.puppetlabs.com/mac/10.11/PC1/x86_64/

Windows:
https://docs.puppet.com/puppet/4.7/reference/install_windows.html#download-the-windows-puppet-agent-package


Ensure these puppet modules are installed:

sudo puppet module install -i ~/provisioning/myaccount-node-developer/environments/development/modules puppetlabs/stdlib

sudo puppet module install -i ~/provisioning/myaccount-node-developer/environments/development/modules puppetlabs/nodejs

sudo puppet module install -i ~/provisioning/node-developer/environments/development/modules puppetlabs/apt


