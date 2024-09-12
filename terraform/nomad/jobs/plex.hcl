job "plex" {
  type = "service"

  constraint {
    attribute = "${attr.unique.hostname}"
    value     = "client03"
  }

  group "plex" {

    network {
      port "http" { static = 32400 }
    }

    volume "plex" {
      type   = "host"
      source = "plex"
    }

    volume "media" {
      type   = "host"
      source = "media"
    }

    service {
      name = "plex"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.plex.entrypoints=websecure",
      ]

      check {
        type     = "tcp"
        interval = "60s"
        timeout  = "20s"
      }
    }

    task "plex" {
      driver = "docker"

      config {
        image        = "plexinc/pms-docker:latest"
        ports        = ["http"]
        network_mode = "host"
      }

      volume_mount {
        volume      = "plex"
        destination = "/config"
      }

      volume_mount {
        volume      = "media"
        destination = "/data"
      }

      env {
        PLEX_UID   = "1010"
        PLEX_GID   = "1010"
        PLEX_CLAIM = "claim-XF5QPGHuQUV5j-nT-zcM"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }
    }
  }
}