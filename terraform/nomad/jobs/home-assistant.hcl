job "home-assistant" {
  datacenters = ["dc1"]
  type        = "service"

  group "home-assistant" {

    network {
      port "http" { static = "8123" }
    }

    volume "home-assistant" {
      type   = "host"
      source = "home-assistant"
    }

    service {
      name = "home-assistant"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.home-assistant.entrypoints=websecure",
        "traefik.http.routers.home-assistant.rule=Host(`home-assistant.bakos.me`) || Host(`hass.bakos.me`)"
      ]
      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "home-assistant" {
      driver = "docker"

      volume_mount {
        volume      = "home-assistant"
        destination = "/config"
      }

      config {
        image        = "homeassistant/home-assistant:2024.8.3"
        ports        = ["http"]
        network_mode = "host"
      }

      env {
        TZ = "America/Denver"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }
    }
  }
}
