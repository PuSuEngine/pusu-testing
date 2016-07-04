# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "ubuntu/trusty64"
    config.vm.boot_timeout = 90

    # SSH agent forwarding makes life easier
    config.ssh.forward_agent = true

    config.vm.network :private_network, ip: "172.20.20.20"

    # Define the vm
    vm_name = "pusudev"
    config.vm.define :dev do |dev|
        dev.vm.hostname = vm_name

        dev.vm.synced_folder "salt/roots/", "/srv/"

        dev.vm.synced_folder ".", "/src/"

        dev.vm.provider "virtualbox" do |v|
            v.name = vm_name

            # Keep the specs low, but give it access to some CPUs
            # this is something you might have to adjust for your machine.
            v.customize ["modifyvm", :id, "--memory", "512"]
            v.customize ["modifyvm", :id, "--cpus", "4"]
            v.customize ["modifyvm", :id, "--ioapic", "on"]

            # Uncomment if you want to see the virtualbox Gui for this VM
            # v.gui = true
        end

        dev.vm.provision :salt do |config|
            config.minion_config = "salt/minion.conf"
            config.run_highstate = true
            config.verbose = false
            config.bootstrap_options = "-F -c /tmp -D"
            config.install_type = "git"
            config.install_args = "develop"
            config.temp_config_dir = "/tmp"
            config.colorize = true
            config.log_level = "info"
        end
    end
end
