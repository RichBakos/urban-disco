build {
  sources = ["source.proxmox-iso.mongo"]

  # Copy local scripts up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "./scripts"
  }

  # Provision
  provisioner "shell" {
    inline_shebang  = "/bin/bash -e"
    inline          = ["/bin/bash /tmp/scripts/provision.sh"]
  }

}