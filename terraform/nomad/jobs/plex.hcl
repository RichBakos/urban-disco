job "plex" {
  datacenters = ["dc1"]
  type        = "service"

  group "plex" {

    network {
      port "http" { static = 32400 }
    }

    volume "plex" {
      type            = "csi"
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
      read_only       = false
      source          = "plex"
    }

    volume "media" {
      type            = "csi"
      attachment_mode = "file-system"
      access_mode     = "multi-node-multi-writer"
      read_only       = false
      source          = "media"
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
        interval = "10s"
        timeout  = "2s"
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
        read_only   = false
      }

      volume_mount {
        volume      = "media"
        destination = "/data"
      }

      env {
        PLEX_UID   = "1010"
        PLEX_GID   = "1010"
        PLEX_CLAIM = "claim-1kbMcezLyfAQEDfz9idS"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }
    }
  }
}