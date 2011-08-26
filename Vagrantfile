Vagrant::Config.run do |config|


  config.vm.define :bm do |bm|

    bm.vm.box = "overtone-native-buildmaster-ubuntu-lucid-x86"

    bm.vm.box = "lucid64"
    bm.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    bm.vm.forward_port "ssh", 22, 2226, :auto => true
    bm.vm.forward_port "buildbot pb",  9989, 9989
    bm.vm.forward_port "buildbot web", 8010, 8010

    bm.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)

    bm.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role "buildmaster"
      chef.log_level = :debug
    end

    bm.vm.network "10.0.0.2"
  end

  config.vm.define :u32 do |u32|
    u32.vm.box = "overtone-native-buildslave-ubuntu-lucid-x86"

    u32.vm.box = "lucid32"
    u32.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    u32.vm.forward_port "ssh", 22, 2229, :auto => true
    
    u32.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)

    u32.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role "buildslave"
      chef.log_level = :debug
    end

    u32.vm.network "10.0.0.3"
  end

  config.vm.define :u64 do |u64|
    u64.vm.box = "overtone-native-buildslave-ubuntu-lucid-x86_64"

    u64.vm.box = "lucid64"
    u64.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    u64.vm.forward_port "ssh", 22, 2210, :auto => true
    
    u64.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)

    u64.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role "buildslave"
      chef.log_level = :debug
    end

    u64.vm.network "10.0.0.4"
  end
end
