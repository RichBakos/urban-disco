#!/usr/bin/bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

# Add ansible
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/ansible.list

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

# Add the repository to Apt sources:
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Add Hashicorp repo
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update

# Install coredns, consul and cloud-init
sudo apt-get update && apt-get install -y glusterfs-client ansible consul packer terraform git make cloud-init

# Configure gluster
sudo echo "pve02.bakos.lan:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=pve03.bakos.lan 0 0" >> /etc/fstab
sudo echo "192.168.1.10  pve01.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.11  pve02.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "192.168.1.12  pve03.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Configure consul
sudo rm /etc/consul.d/*
sudo cp /tmp/configs/consul/client.hcl /etc/consul.d/consul.hcl
sudo systemctl enable consul 

# Disable root
sudo /usr/bin/passwd -l root
sudo sed -e 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/' -i /etc/ssh/sshd_config

# Cleanup tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0