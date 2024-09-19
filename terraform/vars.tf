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

###--- Auth vars ---###
variable "auth_domain" {
  type        = string
  description = "The domain of the homelab"
}

variable "auth_client_id" {
  type        = string
  description = "The client ID for hte forwardAuth plugin for Traefik"
}

variable "auth_client_secret" {
  type        = string
  description = "The client secret for the forwardAuth plgin for Traefik"
}

variable "auth_secret" {
  type        = string
  description = "The secret for teh forwardAuth plugin for Traefik"
}

variable "auth_whitelist_email" {
  type        = string
  description = "The email to be whitelisted by the forwardAuth plugin"
}

###--- Grafana vars ---###
variable "grafana_email" {
  type        = string
  description = "The username of the grafana admin"
}

variable "grafana_password" {
  type        = string
  description = "The password used by the grafana admin"
}

variable "grafana_url" {
  type        = string
  description = "The URL of the grafana instance"
}

variable "postgres_root_user" {
  type        = string
  description = "The root user for postgres"
}

variable "postgres_root_password" {
  type        = string
  description = "The password for the Postgres root user"
}

###--- Influxdb vars ---###
variable "influxdb_password" {
  type        = string
  description = "The password for the Postgres root user"
}

variable "influxdb_user" {
  type        = string
  description = "The root user for postgres"
}

###--- Samba vars ---###
variable "samba_password" {
  type        = string
  description = "The password for samba"
}

variable "samba_share" {
  type        = string
  description = "The samba share"
}

variable "samba_uid" {
  type        = string
  description = "The UID for the samba user"
}

###--- Mongo vars ---###
variable "mongo_password" {
  type        = string
  description = "The mongo password for the Unifi db"
}

variable "mongo_user" {
  type        = string
  description = "The mongo user for the unifi db"
}

variable "mongo_initdb_root_username" {
  type        = string
  description = "The mongo user for the auth db"
}

variable "mongo_initdb_root_password" {
  type        = string
  description = "The mongo password for the auth db"
}

###--- Plex vars ---###
variable "plex_auth_token" {
  type        = string
  description = "The API of the plex instance"
}

variable "storage_pool" {
  type        = string
  description = "The storage pool for the systems"
}


variable "bridge" {
  type        = string
  description = "The network bridge used by the virtual machines"
}