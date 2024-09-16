job "flaresolverr" {
  datacenters = ["dc1"]
  type        = "service"

  group "flaresolverr" {

    network {
      port "http" { static = "8191" }
    }

    volume "flaresolverr" {
      type   = "host"
      source = "flaresolverr"
    }

    volume "media" {
      type   = "host"
      source = "media"
    }

    service {
      name = "flaresolverr"
      port = "http"
      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "flaresolverr" {
      driver = "docker"

      config {
        image = "ghcr.io/flaresolverr/flaresolverr:latest"
        ports = ["http"]
      }

      volume_mount {
        volume      = "flaresolverr"
        destination = "/config"
      }

      volume_mount {
        volume      = "media"
        destination = "/data"
      }

      env {
        PUID = 1010
        PGID = 1010
        TZ   = "America/Denver"
      }

      resources {
        cpu    = 500
        memory = 512
      }
    }
  }
}
