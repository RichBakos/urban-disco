#!/usr/bin/bash

set -o errexit

# Install gluster client, nfs, docker, consul and cloud-init
sudo apt-get update && apt-get install -y glusterfs-client docker-ce cloud-init

# Add gluster mount in fstab
sudo echo "172.16.20.202:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=172.16.20.203 0 0" >> /etc/fstab

# Add gluster hosts to... Hosts
sudo echo "172.16.20.201 pmx201.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.202 pmx202.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.203 pmx203.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Setup coredns in docker
# sudo docker pull coredns/coredns
# sudo docker run -d --name coredns --restart=always --volume=/mnt/volumes/coredns/:/root/ -p 53:53/udp coredns/coredns -conf /root/Corefile

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