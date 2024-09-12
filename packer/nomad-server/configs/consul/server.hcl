server             = true
client_addr        = "0.0.0.0"
advertise_addr     = "{{GetInterfaceIP \"eth0\"}}"
bind_addr          = "{{GetInterfaceIP \"eth0\"}}"
bootstrap_expect   = 3
data_dir           = "/opt/consul"
datacenter         = "dc1"
enable_syslog      = true
log_level          = "warn"
retry_join         = ["172.16.30.20", "172.16.30.21", "172.16.30.22"]
acl {
  enabled = true
}
ui_config {
  enabled = true
}
