Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-8.2"
  config.vm.box_version = "202006.16.0"
  config.vm.network  "public_network", type: "dhcp"

  config.vm.define "vm2" do |vm2|
    vm2.vm.synced_folder "../share", "/share"
    vm2.vm.provision :shell, :path => "tomcat-up.sh"
    vm2.vm.provider "virtualbox" do |vb|
      vb.name = "tomcat-vm2"
      vb.memory = "4096"
    end
  end

  config.vm.define "vm1" do |vm1|
    vm1.vm.synced_folder "..\\share", "/share"
    vm1.vm.synced_folder "..\\nfsshare", "/nfsshare", type: "nfs"
    vm1.vm.provision :shell, :path => "nginx-up.sh"
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "nginx-vm1"
      vb.memory = "1024"
    end
  end
    
end
