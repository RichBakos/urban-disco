build {
  sources = ["source.proxmox-iso.nomad-server"]
  
    # Copy shared config files up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "../shared-config"
  }

  # Copy scripts up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "./scripts"
  }

# Copy configs up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "./configs"
  }

  # Add repos
  provisioner "shell" {
    inline_shebang  = "/bin/bash -e"
    inline          = ["/bin/bash /tmp/shared-config/repos.sh"]
  }
  
  # Provision
  provisioner "shell" {
    inline_shebang  = "/bin/bash -e"
    inline          = ["/bin/bash /tmp/scripts/provision.sh"]
  }
 
}