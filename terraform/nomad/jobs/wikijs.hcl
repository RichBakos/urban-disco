job "wikijs" {
  datacenters = ["dc1"]  
  type        = "service"

  group "wikijs" {

    network {
      port "http" { static = 3000 }
    }

    volume "wikijs" {
      type   = "host"
      source = "wikijs"
    }

    service {
      name = "wikijs"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.wikijs.entrypoints=websecure",
        "traefik.http.routers.wikijs.middlewares=auth",
      ]

      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "wikijs" {
      driver = "docker"

      config {
        image        = "linuxserver/wikijs:2.5.303"
        network_mode = "host"
        ports        = ["http"]
      }

      volume_mount {
        volume      = "wikijs"
        destination = "/config"
      }

      env {
        PUID = 1010
        PGID = 1010
        TZ   = "America/Denver"
      }

      resources {
        cpu    = 250
        memory = 256
      }
    }
  }
}