#!/usr/bin/bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

# Add gluster repo
sudo apt-get update
wget -O - https://download.gluster.org/pub/gluster/glusterfs/9/rsa.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/gluster.gpg
DEBID=$(grep 'VERSION_ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
DEBVER=$(grep 'VERSION=' /etc/os-release | grep -Eo '[a-z]+')
DEBARCH=$(dpkg --print-architecture)
echo "deb [signed-by=/etc/apt/trusted.gpg.d/gluster.gpg] https://download.gluster.org/pub/gluster/glusterfs/LATEST/Debian/${DEBID}/${DEBARCH}/apt ${DEBVER} main" > /etc/apt/sources.list.d/gluster.list

# Remove old Docker
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the docker repo to Apt sources:
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Add Hashicorp repo
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update

# Install gluster, docker, nomad, consul, cloud-init
sudo apt-get update && apt-get install -y glusterfs-client docker-ce consul nomad cloud-init

# Configure gluster
sudo echo "pve02.bakos.lan:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=pve03.bakos.lan 0 0" >> /etc/fstab
sudo echo "192.168.1.10  pve01.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.11  pve02.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.12  pve03.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Configure consul and nomad
sudo rm /etc/consul.d/* /etc/nomad.d/*
sudo cp /tmp/configs/consul/client.hcl /etc/consul.d/consul.hcl
sudo cp /tmp/configs/nomad/client.hcl /etc/nomad.d/nomad.hcl
sudo cp /tmp/storage/volumes.hcl /etc/nomad.d/volumes.hcl
sudo systemctl enable consul nomad

# Add a media user
sudo /sbin/groupadd -g 1010 media
sudo /sbin/useradd -M -u 1010 -g 1010 media
sudo /sbin/usermod -L media

# Disable root
sudo /usr/bin/passwd -l root
sudo sed -e 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/' -i /etc/ssh/sshd_config

# Cleanup tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0