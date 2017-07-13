`touch MyVagrantfile`
load 'MyVagrantfile'

Vagrant.configure("2") do |config|
  host = "test.local"
  ip = "192.168.35.35"
  port = 2224

  config.ssh.username = "vagrant"
  #config.ssh.password = "vagrant"
  #config.ssh.private_key_path = "keys/id_rsa"
  config.vm.box = "bento/centos-7.3"

  config.vm.network "private_network", ip: "#{ip}"
  config.vm.network "forwarded_port", guest: 22, host: port, id: "ssh"
  config.vm.provider "virtualbox" do |vb|
  	vb.name = "#{host}"
    vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
  end
  config.vm.define "#{host}" do |t|
    t.vm.hostname = "#{host}"
  end
  config.vm.provision "ansible" do |ansible|
  	ansible.playbook = "ansible/test.yml"
  	ansible.inventory_path = "ansible/test.hosts"
  end
end