#Install
sudo apt install virtualbox vagrant ansible nfs-kernel-server

#Clone
cd
git clone [git repository]

#Get box
cd ~/vagarnt/[folder name]
scp [ip address]:[folder name]/[file name]

#Add box
vagrant box add --force [current name] [box name]

#Add host
sudod sh -c "echo '[ip address] [host name]' >> /etc/hosts"

#Start server without provision
vagrant up --no-provision

#Check running machines
VBoxManage list runningvms

#Add ssh config
vagrant ssh-config >> ~/.ssh/config

#vim ~/.ssh/config
Host [hostname]
  Hostname 127.0.0.1
  User vagrant
  Port 2223
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentitiesOnly yes
  LogLevel FATAL
  IdentityFile ~/vagrant/[host name]/keys/id_rsa

#Change permission
chmod 600 ~/vagrant/[host name]/keys/id_rsa

#Provision with Ansible
vagrant provision

#Check http
http://[host name]

#Connect
ssh [host name]

#Stop server
vagrant halt

#Delete server
vagrant destroy