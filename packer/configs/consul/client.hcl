server       = false
client_addr  = "0.0.0.0"
bind_addr    = "{{GetInterfaceIP \"eth0\"}}"
data_dir     = "/opt/consul"
datacenter   = "dc1"
retry_join   = ["server01.bakos.lan","server02.bakos.lan", "server03.bakos.lan"]

