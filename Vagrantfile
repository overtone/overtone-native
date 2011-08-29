Vagrant::Config.run do |config|

  config.vm.define :bm do |bm|

    bm.vm.customize do |vm|
      vm.memory_size = 512
    end

#    bm.vm.boot_mode = :gui

    bm.vm.box = "lucid32"
    bm.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    bm.vm.forward_port "ssh", 22, 2226, :auto => true
#    bm.vm.forward_port "buildbot pb",  9989, 9989
#    bm.vm.forward_port "buildbot web", 8010, 8010

    bm.vm.share_folder("v-root", "/vagrant", ".", :nfs => false)

    bm.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role "buildmaster"
      chef.log_level = :debug
    end

    bm.vm.network "10.0.0.2"
  end

  config.vm.define :u32 do |u32|

    u32.vm.customize do |vm|
      vm.memory_size = 4096
      vm.cpu_count = 3
    end

 #   u32.vm.boot_mode = :gui

    u32.vm.box = "lucid32"
    u32.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    u32.vm.forward_port "ssh", 22, 2229, :auto => true

    u32.vm.share_folder("v-root", "/vagrant", ".", :nfs => false)

    u32.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role "buildslave"
      chef.log_level = :debug
    end

    u32.vm.network "10.0.0.3"
  end

  config.vm.define :u64 do |u64|

    u64.vm.customize do |vm|
      vm.memory_size = 4096
      vm.cpu_count = 3
    end

#    u64.vm.boot_mode = :gui

    u64.vm.box = "lucid64"
    u64.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    u64.vm.forward_port "ssh", 22, 2210, :auto => true

    u64.vm.share_folder("v-root", "/vagrant", ".", :nfs => false)

    u64.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role "buildslave"
      chef.log_level = :debug
    end

    u64.vm.network "10.0.0.4"
  end

#  config.vm.define :mac do |mac|
#
#    mac.vm.customize do |vm|
#      vm.memory_size = 2048
#    end
#
##    mac.vm.boot_mode = :gui
#
#    mac.vm.box = "macosx-snowleopard"
#
#    mac.vm.forward_port "ssh", 22, 2211, :auto => true
#    mac.vm.provision :shell, :path => "macosx-setup.sh"
#
#    mac.ssh.private_key_path = "~/.ssh/id_overtone"
#
#    mac.vm.network "10.0.0.4"
#
#  end
end
