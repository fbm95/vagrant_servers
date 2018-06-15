Vagrant.configure(2) do |config|
  
  config.vm.define :saltmaster, primary: true do |master_config|
    
    master_config.vm.network "forwarded_port", guest: 8080, host: 8080
    master_config.vm.network "forwarded_port", guest: 50000, host: 50000

    master_config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "saltmaster"
    end

    master_config.vm.box = "ubuntu/xenial64"
    master_config.vm.host_name = 'saltmaster.local'
    #https://www.vagrantup.com/docs/networking/private_network.html
    master_config.vm.network "private_network", ip: "172.17.8.100"
    master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
    master_config.vm.synced_folder "saltstack/pillar/", "/srv/pillar"

    #https://www.vagrantup.com/docs/provisioning/salt.html
    master_config.vm.provision :salt do |salt|
      salt.master_config = "saltstack/etc/master"
      # sudo salt-key --gen-keys=key_name --gen-keys-dir=/tmp/testkey
      salt.master_key = "saltstack/keys/master_minion.pem"
      salt.master_pub = "saltstack/keys/master_minion.pub"
      salt.minion_key = "saltstack/keys/master_minion.pem"
      salt.minion_pub = "saltstack/keys/master_minion.pub"
      salt.seed_master = {
        "minion01" => "saltstack/keys/minion01.pub",
        "minion02" => "saltstack/keys/minion02.pub",
        "minion03" => "saltstack/keys/minion03.pub"
      }
      salt.install_type = "stable"
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
      salt.colorize = true
      #https://docs.saltstack.com/en/latest/topics/tutorials/salt_bootstrap.html
      salt.bootstrap_options = "-P -c /tmp"
    end

    master_config.vm.provision :shell, path: "vagrant-provision/config_master.sh"
    master_config.vm.provision :shell, path: "vagrant-provision/install_jenkins.sh"
  end

  config.vm.define "minion01" do |minion_config|
    #minion_config.vm.network "forwarded_port", guest: 8088, host: 8088
    #microservices
    # for i in 1221..1224
    #   minion_config.vm.network :forwarded_port, guest: i, host: i
    # end

    # #db
    # minion_config.vm.network :forwarded_port, guest: 1234, host: 1234

    #docker api
    minion_config.vm.network :forwarded_port, guest: 2376, host: 2376

    #swarm visualizer
    minion_config.vm.network :forwarded_port, guest: 5000, host: 5000

    minion_config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "swarm_manager"
    end
    minion_config.vm.box = "ubuntu/xenial64"
    minion_config.vm.hostname = "minion01"
    minion_config.vm.network "private_network", ip: "172.17.8.101"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion01"
      salt.minion_key = "saltstack/keys/minion01.pem"
      salt.minion_pub = "saltstack/keys/minion01.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define "minion02" do |minion_config|
    minion_config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
      vb.name = "worker01"
    end
    minion_config.vm.box = "ubuntu/xenial64"
    minion_config.vm.hostname = "minion02"
    minion_config.vm.network "private_network", ip: "172.17.8.102"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion02"
      salt.minion_key = "saltstack/keys/minion02.pem"
      salt.minion_pub = "saltstack/keys/minion02.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define "minion03" do |minion_config|
    minion_config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
      vb.name = "worker02"
    end
    minion_config.vm.box = "ubuntu/xenial64"
    minion_config.vm.hostname = "minion03"
    minion_config.vm.network "private_network", ip: "172.17.8.103"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion03"
      salt.minion_key = "saltstack/keys/minion03.pem"
      salt.minion_pub = "saltstack/keys/minion03.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

end