resource "consul_key_prefix" "prometheus" {
  path_prefix = "homelab/prometheus/"
  subkeys = {
    "prometheus.yml" = file("${path.module}/files/prometheus/prometheus.yaml"),
  }
}

resource "consul_key_prefix" "loki" {
  path_prefix = "homelab/loki/"
  subkeys = {
    "loki.yaml" = file("${path.module}/files/loki/loki.yaml"),
  }
}

resource "consul_key_prefix" "traefik" {
  path_prefix = "homelab/traefik/"
  subkeys = {
    "traefik.yaml" = file("${path.module}/files/traefik/traefik.yaml"),
    "dynamic.yaml" = file("${path.module}/files/traefik/dynamic.yaml"),
  }
}

resource "consul_key_prefix" "vector" {
  path_prefix = "homelab/vector/"
  subkeys = {
    "vector.toml" = file("${path.module}/files/vector/vector.toml"),
  }
}
