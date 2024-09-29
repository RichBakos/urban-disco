#!/usr/bin/bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

# Import MongoDB key and add repo
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
sudo echo "deb http://repo.mongodb.org/apt/debian bookworm/mongodb-org/6.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Install gluster client, mongo and cloud-init
sudo apt-get update && apt-get install -y glusterfs-client mongodb-org cloud-init


# Add gluster mount in fstab
sudo echo "pve02.bakos.lan:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=pve03.bakos.lan 0 0" >> /etc/fstab

# Add gluster hosts to... Hosts 
sudo echo "192.168.1.10  pve01.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.11  pve02.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.12  pve03.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Enable MongoDB
sudo systemctl enable mongod.service

# Disable root
sudo /usr/bin/passwd -l root
sudo sed -e 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/' -i /etc/ssh/sshd_config

# Cleanup tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0