job "bitwarden" {
  datacenters = ["dc1"]
  type        = "service"

  group "bitwarden" {

    network {
      port "http" { to = 8089 }
    }

    volume "bitwarden" {
      type      = "host"
      source    = "bitwarden"
      read_only = false
    }

    service {
      name = "bitwarden"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.bitwarden.entrypoints=websecure",
        "traefik.http.routers.bitwarden.middlewares=auth"
      ]

      check {
        type     = "tcp"
        port     = "http"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "bitwarden" {
      driver = "docker"

      env {
        ROCKET_PORT = 8089
      }

      config {
        image        = "vaultwarden/server:1.31.0"
        network_mode = "host"
        ports        = ["http"]
      }

      volume_mount {
        volume      = "bitwarden"
        destination = "/data"
      }

      resources {
        cpu    = 250
        memory = 256
      }

    }
  }
}