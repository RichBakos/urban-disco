#!/usr/bin/bash

set -o errexit

# Install gluster client, docker, consul and cloud-init
sudo apt-get update && apt-get install -y glusterfs-client docker-ce consul cloud-init

# Add gluster mount in fstab
sudo echo "pve02.bakos.me:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=pve03.bakos.me 0 0" >> /etc/fstab

# Add gluster hosts to... Hosts 
sudo echo "192.168.1.10  pve01.bakos.me" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.11  pve02.bakos.me" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.12  pve03.bakos.me" >> /etc/cloud/templates/hosts.debian.tmpl

# Remove consul/nomad defaults, install our configs, setup consul services
sudo rm /etc/consul.d/*
sudo cp /tmp/configs/consul/client.hcl /etc/consul.d/consul.hcl
sudo cp /tmp/configs/consul/dns.service.hcl /etc/consul.d/dns.service.hcl
sudo systemctl enable consul

# Setup coredns in docker
sudo docker pull coredns/coredns
sudo docker run -d --name coredns --restart=always --volume=/mnt/volumes/coredns/:/root/ -p 53:53/udp coredns/coredns -conf /root/Corefile

# Add a media user (shared account for media apps)
sudo /sbin/groupadd -g 1010 media
sudo /sbin/useradd -M -u 1010 -g 1010 media
sudo /sbin/usermod -L media

# Disable root
sudo /usr/bin/passwd -l root
sudo sed -e 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/' -i /etc/ssh/sshd_config

# Truncate machine-id
sudo truncate -s 0 /etc/machine-id
sudo truncate -s 0 /var/lib/dbus/machine-id

# Cleanup tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0