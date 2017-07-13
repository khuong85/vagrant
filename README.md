# Version (Use latest stable version)
```
VBoxManage --version

vagrant --version
```

# Add host
```
sudo sh -c "echo '192.168.35.35 test.local' >> /etc/hosts"
```

# Start server without provision
```
vagrant up --no-provision
```

# Check running machines
```
VBoxManage list runningvms
```

# Add ssh config
```
vagrant ssh-config >> ~/.ssh/config

# Provision with Ansible
```
vagrant provision
```

# Connect
```
ssh appbase.local
```

# Stop server(if you need)
```
vagrant halt
```

# Delete server(if you need)
```
vagrant destroy
```