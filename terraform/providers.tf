provider "nomad" {
  address = "http://server02.bakos.lan:4646"
}

provider "consul" {
  address = var.consul_url
}