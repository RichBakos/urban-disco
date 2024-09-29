build {
  sources = ["source.proxmox-iso.logging"]

  # Copy shared config up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "../shared-config"
  }

  # Copy local scripts up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "./scripts"
  }

  # Copy local configs up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "./configs"
  }

# copy repos up to tmp
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