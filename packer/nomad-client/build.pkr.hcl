build {
  sources = ["source.proxmox-iso.nomad-client"]

  # Copy volumesup to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "../../storage/volumes.hcl"
  }

  # Copy shared config files up to tmp
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