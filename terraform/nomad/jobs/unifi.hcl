job "unifi" {
  datacenters = ["dc1"]
  type        = "service"

  constraint {
    attribute = "${attr.unique.hostname}"
    value     = "client01"
  }

  group "unifi" {

    network {
      port "http" { static = "8443" }
    }

    volume unifi {
      type   = "host"
      source = "unifi"
    }

    service {
      name = "unifi"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.unifi.entrypoints=websecure",
        "traefik.http.services.unifi.loadbalancer.server.scheme=https",
        "traefik.http.routers.unifi.middlewares=auth",
      ]
      check {
        type     = "tcp"
        port     = "http"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "unifi" {
      driver = "docker"

      config {
        image        = "linuxserver/unifi-network-application:8.4.59"
        network_mode = "host"
        ports        = ["http"]
        volumes = [
          "/mnt/volumes/unifi/init-mongo.sh:/docker-entrypoint-initdb.d/init-mongo.sh:ro",
        ]
      }

      volume_mount {
        volume      = "unifi"
        destination = "/config"
      }

      resources {
        cpu    = 1000
        memory = 1536
      }

      template {
        env         = true
        destination = "secrets/unifi.env"
        data        = <<-EOF
        {{- with nomadVar "nomad/jobs/unifi" }}
          {{- range .Tuples }}
            {{ .K }}={{ .V }}
          {{- end }}
        {{- end }}
        EOF
      }
    }
  }
}