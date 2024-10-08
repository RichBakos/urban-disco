# resource "proxmox_vm_qemu" "overwatch" {

#   name        = "overwatch"
#   target_node = "pve01"
#   clone       = "overwatch-server"
#   full_clone  = true

#   cores     = 2
#   sockets   = 1
#   cpu       = "host"
#   memory    = 4096
#   scsihw    = "virtio-scsi-single"
#   bootdisk  = "scsi0"
#   bios      = "seabios"
#   skip_ipv6 = true
#   onboot    = true
#   agent     = 1

#   os_type    = "cloud_init"
#   ciuser     = var.ciuser
#   cipassword = var.cipassword
#   sshkeys    = var.proxmox_sshkeys
#   ipconfig0  = "ip=dhcp"


#   network {
#     model  = "virtio"
#     bridge = var.bridge    
#     tag    = var.vlan_tag    
#   }

#   disks {
#     scsi {
#       scsi0 {
#         disk {
#           size       = "4G"
#           storage    = var.storage_pool
#           iothread   = true
#           emulatessd = true
#           discard    = true
#         }
#       }
#     }
#     ide {
#       ide0 {
#         cloudinit {
#           storage = var.storage_pool
#         }
#       }
#     }
#   }

#   lifecycle {
#     ignore_changes = all
#   }

#   provisioner "remote-exec" {
#     inline = [ "sudo reboot now" ]

#     connection {
#       type     = "ssh"
#       user     = var.ciuser
#       password = var.cipassword
#       host     = self.default_ipv4_address
#     }
#   }  
# }
