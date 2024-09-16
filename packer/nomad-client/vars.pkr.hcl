variable "proxmox_api_url" {
  type        = string
  sensitive   = true
  description = "The url of proxmox"
  default     = env("proxmox_url")
}

variable "proxmox_api_user" {
  type        = string
  description = "The api user being used to connect the provider"
  default     = env("proxmox_api_user")
}

variable "proxmox_api_password" {
  type        = string
  sensitive   = true
  description = "The password for the api user being used by the provider"
  default     = env("proxmox_api_password") 
}

variable "proxmox_node" {
  type        = string
  description = "The proxmox node being deployed to"
  default     = env("proxmox_node")  
}

variable "iso_file" {
  type        = string
  description = "The iso file being used to create this image from"
  default     = env("iso_file")  
}

variable "storage_pool" {
  type        = string
  description = "The storage pool used to house our vm images"
  default     = env("storage_pool")  
}

variable "bridge" {
  type        = string
  description = "The network bridge assigned to the vm guest"
  default     = env("bridge")  
}

variable "vlan_tag" {
  type        = string
  description = "The vlan this image will run in" 
  default     = env("vlan_tag")  
}

variable "ssh_username" {
  type       = string
  sensitive  = true
 description = "The user being used for provisioning"
  default     = env("ssh_username") 
}

variable "ssh_password" {
  type        = string
  sensitive   = true
  description = "The password of the provisioning user"
  default     = env("ssh_password")   
}
