server       = false
client_addr  = "0.0.0.0"
bind_addr    = "{{GetInterfaceIP \"eth0\"}}"
data_dir     = "/opt/consul"
datacenter   = "dc1"
retry_join   = ["172.16.30.20", "172.16.30.21", "172.16.30.22"]
