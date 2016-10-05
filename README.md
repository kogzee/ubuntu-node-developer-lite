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


Ensure these puppet modules are installed (correct the path as per your machine)

sudo puppet module install -i ~/provisioning/myaccount-node-developer/environments/development/modules puppetlabs/stdlib

sudo puppet module install -i ~/provisioning/myaccount-node-developer/environments/development/modules puppetlabs/nodejs

sudo puppet module install -i ~/provisioning/node-developer/environments/development/modules puppetlabs/apt

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


