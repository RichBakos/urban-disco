#!/usr/bin/bash

set -o errexit

# Add packages
sudo apt-get update && apt-get install -y consul nomad cloud-init

# Add gluster mount in fstab
sudo echo "pve02.bakos.me:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=pve03.bakos.me 0 0" >> /etc/fstab

# Remove consul and nomad defaults, install our configs, including host volumes
sudo rm /etc/consul.d/* /etc/nomad.d/*
sudo cp /tmp/configs/consul/server.hcl /etc/consul.d/consul.hcl
sudo cp /tmp/configs/nomad/server.hcl /etc/nomad.d/nomad.hcl

# Enable consul and nomad
sudo systemctl enable consul nomad

# Prohibit ssh for root
sudo /usr/bin/passwd -l root
sudo sed -e 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/' -i /etc/ssh/sshd_config

# Truncate machine-id
sudo truncate -s 0 /etc/machine-id
sudo truncate -s 0 /var/lib/dbus/machine-id

# Cleanup tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0