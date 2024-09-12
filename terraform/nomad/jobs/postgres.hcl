job "postgres" {
  type = "service"

  constraint {
    attribute = "${attr.unique.hostname}"
    value     = "client03"
  }
  
  group "postgres" {

    network {
      port "postgres" { to = "5432" }
    }

    volume postgres {
      type   = "host"
      source = "postgres"
    }

    service {
      name = "postgres"
      port = "postgres"
      tags = [
        "traefik.enable=true",
        "traefik.tcp.routers.postgres.entrypoints=postgres",
        "traefik.tcp.routers.postgres.rule=HostSNI(`*`)",
        "traefik.tcp.services.postgres.loadBalancer.server.port=${NOMAD_HOST_PORT_postgres}"
      ]

      check {
        type     = "tcp"
        port     = "postgres"
        interval = "10s"
        timeout  = "30s"
      }
    }

    task "postgres" {
      driver = "docker"

      volume_mount {
        volume      = "postgres"
        destination = "/var/lib/pgsql/data"
      }

      config {
        image = "postgres:16.4"
        ports = ["postgres"]
      }

      template {
        env         = true
        destination = "secrets/postgres.env"
        data        = <<-EOF
        {{- with nomadVar "nomad/jobs/postgres" }}
          {{- range .Tuples }}
            {{ .K }}={{ .V }}
          {{- end }}
        {{- end }}
        EOF
      }

      resources {
        cpu    = 1000
        memory = 1024
      }
    }
  }
}
