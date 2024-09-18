#!/usr/bin/bash

set -o errexit

# Install gluster client, nfs, docker, consul and cloud-init
sudo apt-get update && apt-get install -y glusterfs-client docker-ce cloud-init

# Add gluster mount in fstab
sudo echo "pve02.bakos.me:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=pve03.bakos.me 0 0" >> /etc/fstab

# Add gluster hosts to... Hosts 
sudo echo "192.168.1.10  pve01.bakos.me" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.11  pve02.bakos.me" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.12  pve03.bakos.me" >> /etc/cloud/templates/hosts.debian.tmpl

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