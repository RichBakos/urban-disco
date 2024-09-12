#!/usr/bin/bash

set -o errexit

# Add packages
sudo apt-get update && apt-get install -y glusterfs-client docker-ce nfs-common consul nomad cloud-init

# Add gluster mount in fstab
sudo echo "172.16.20.202:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=172.16.20.203 0 0" >> /etc/fstab

# Add Gluster hosts to Hosts
sudo echo "172.16.20.201 pmx201.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.202 pmx202.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.203 pmx203.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Remove consul and nomad defaults, install our configs, including host volumes
sudo rm /etc/consul.d/* /etc/nomad.d/*
sudo cp /tmp/configs/consul/client.hcl /etc/consul.d/consul.hcl
sudo cp /tmp/configs/nomad/client.hcl /etc/nomad.d/nomad.hcl
sudo cp /tmp/configs/nomad/volumes.hcl /etc/nomad.d/volumes.hcl

# Enable consul and nomad
sudo systemctl enable consul nomad

# Add a media user
sudo /sbin/groupadd -g 1010 media
sudo /sbin/useradd -M -u 1010 -g 1010 media
sudo /sbin/usermod -L media

# Disable root and prohibit ssh
sudo /usr/bin/passwd -l root
sudo sed -e 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/' -i /etc/ssh/sshd_config

# Truncate machine-id
sudo truncate -s 0 /etc/machine-id
sudo truncate -s 0 /var/lib/dbus/machine-id

# Cleanup tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0