Vagrant.configure("2") do |config|

    # cloud MEAN stack
    config.vm.define :myaccount do |box|
        box.vm.box = "puppetlabs/ubuntu-16.04-64-puppet"
        box.vm.box_url = "https://atlas.hashicorp.com/puppetlabs/boxes/ubuntu-16.04-64-puppet"
        box.vm.hostname = "myaccount"

        # Fixes "stdin: is not a tty" and "mesg: ttyname failed : Inappropriate ioctl for device" messages --> mitchellh/vagrant#1673
        #box.vm.provision :shell , inline: "(grep -q 'mesg n' /root/.profile && sed -i '/mesg n/d' /root/.profile && echo 'Ignore the previous error, fixing this now...') || exit 0;"
    end
    
    #
    # Vagrant settings
    #

    # Setup puppet
    config.vm.provision :shell, :inline => "apt-get update --fix-missing"
    
    config.vm.provision :puppet do |puppet|
        # Specify the paths for puppet
        puppet.environment_path = "environments"
       	puppet.environment = 'development'
        # Working dir needs to be set because vagrant does not calculate path
        # relative to the environment
        puppet.working_directory = '/tmp/vagrant-puppet/environments/development'
  
        # Enable verbose and debugging output
        #puppet.options = "--verbose --debug"
        # Specify some custom facter entries
        puppet.facter = {
            "vagrant" => "1",
        }
    end

    # Forward our ssh agent
    #config.ssh.forward_agent = true

    # Tweak the vbox settings
    config.vm.provider :virtualbox do |vb|
        # Give the server x Mb of ram
        vb.customize ["modifyvm", :id, "--memory", 4096]
        vb.customize ["modifyvm", :id, "--vram", "32"]
        # Enable DNS resolution
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

        vb.gui = true
        
        # If you want more cores than one in the VM, modify below  
        #vb.customize ["modifyvm", :id, "--cpus", "2"]
        #vb.customize ["modifyvm", :id, "--ioapic", "on"]
    end
end

