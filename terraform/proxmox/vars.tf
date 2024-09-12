###--- Proxmox vars ---###

variable "proxmox_api_url" {
  type        = string
  description = "The url to Proxmox"
}

variable "proxmox_user" {
  type        = string
  description = "The user that Telmate will use to log into Proxmox"
}

variable "proxmox_password" {
  type        = string
  description = "The password for the user that Telmate will use to log into Proxmox"
}

variable "proxmox_nodes" {
  type        = list(string)
  description = "The proxmox nodes that nomad clients will be deployed to"
}

variable "proxmox_service_node" {
  type        = string
  description = "The proxmox node that cluster services will be deployed to"
}

variable "server_mac_addr" {
  type        = list(string)
  description = "The mac addr of the nomad server"
}

variable "server_hostname" {
  type        = list(string)
  description = "The host name of the nomad server"
}

variable "client_mac_addr" {
  type        = list(string)
  description = "The mac addr of the nomad client"
}

variable "client_hostname" {
  type        = list(string)
  description = "The host name of the nomad client"
}

variable "ciuser" {
  type        = string
  description = "The system user to be configured by cloud-init"
}

variable "cipassword" {
  type        = string
  description = "The system user's password to be configured by cloud-init"
}

variable "proxmox_sshkeys" {
  type        = string
  description = "The system user's ssh keys to be configured by cloud-init"
}

variable "storage_pool" {
  type        = string
  description = "The storage pool for the systems"
}

variable "vlan_tag" {
  type        = string
  description = "The vlan that the cluster will run under"
}

variable "bridge" {
  type        = string
  description = "The network bridge used by the virtual machines"
}