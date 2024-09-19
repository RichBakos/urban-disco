resource "proxmox_vm_qemu" "cluster-services" {

  name        = "services01"
  target_node = var.proxmox_nodes[2]
  clone       = "cluster-services"
  full_clone  = true

  cores     = 2
  sockets   = 1
  cpu       = "host"
  memory    = 2048
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

    # Used in place of static IP  
    macaddr = "bc:24:11:cd:cd:50"
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
