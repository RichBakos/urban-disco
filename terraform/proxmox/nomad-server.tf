resource "proxmox_vm_qemu" "nomad-server" {

  #depends_on = [resource.proxmox_vm_qemu.opensearch]

  count       = 3
  name        = var.server_hostname[count.index]
  target_node = var.proxmox_nodes[count.index]
  clone       = "nomad-server"
  full_clone  = true

  cores     = 2
  sockets   = 1
  cpu       = "host"
  memory    = 4096
  scsihw    = "virtio-scsi-single"
  bootdisk  = "scsi0"
  bios      = "seabios"
  skip_ipv6 = true
  onboot    = true
  agent     = 1

  os_type    = "cloud_init"
  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.proxmox_sshkeys
  ipconfig0  = "ip=dhcp"

  network {
    model  = "virtio"
    bridge = var.bridge

    # For DHCP reservation
    macaddr = var.server_mac_addr[count.index]
  }

  disks {
    scsi {
      scsi0 {
        disk {
          size       = "4G"
          storage    = var.storage_pool
          iothread   = true
          emulatessd = true
          discard    = true
        }
      }
    }
    ide {
      ide0 {
        cloudinit {
          storage = var.storage_pool
        }
      }
    }
  }

  lifecycle {
    ignore_changes = all
  }
}

