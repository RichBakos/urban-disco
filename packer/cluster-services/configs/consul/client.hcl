server       = false
client_addr  = "0.0.0.0"
bind_addr    = "{{GetInterfaceIP \"eth0\"}}"
data_dir     = "/opt/consul"
datacenter   = "dc1"
retry_join   = ["server01.bakos.me","server02.bakos.me", "server03.bakos.me"]
