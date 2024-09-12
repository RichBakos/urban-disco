job "traefik" {
  type     = "system"
  priority = 90

  group "traefik" {

    network {
      port "http" { static = "80" }
      port "https" { static = "443" }
      port "postgres" { static = "5432" }
    }

    volume certs {
      type   = "host"
      source = "certs"
    }

    service {
      name = "traefik"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.api.entrypoints=websecure",
        "traefik.http.routers.api.service=api@internal",
        "traefik.http.services.dummy.loadbalancer.server.port=9000",
        "traefik.http.routers.api.middlewares=auth",
      ]

      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "30s"
      }
    }

    task "traefik" {
      driver = "docker"

      config {
        image        = "traefik:3.1.2"
        ports        = ["http", "https", "postgres"]
        network_mode = "host"
        volumes = [
          "local/traefik.yaml:/etc/traefik/traefik.yaml",
          "local/dynamic.yaml:/etc/traefik/dynamic/dynamic.yaml"
        ]
      }

      volume_mount {
        volume      = "certs"
        destination = "/etc/traefik/certs"
      }

      resources {
        cpu    = 250
        memory = 256
      }

      template {
        destination = "local/traefik.yaml"
        data        = <<-EOF
        {{- key "homelab/traefik/traefik.yaml" }}
        EOF
      }

      template {
        destination = "local/dynamic.yaml"
        data        = <<-EOF
        {{- key "homelab/traefik/dynamic.yaml" }}
        EOF
      }
    }
  }
}
