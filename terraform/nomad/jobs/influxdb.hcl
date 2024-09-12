job "influxdb" {
  type = "service"

  group "influxdb" {

    network {
      port "http" { static = "8086" }
    }

    volume "influxdb-config" {
      type   = "host"
      source = "influxdb-config"
    }

    volume "influxdb-data" {
      type   = "host"
      source = "influxdb-data"
    }

    service {
      name = "influxdb"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.influxdb.entrypoints=websecure",
        "traefik.http.routers.influxdb.middlewares=auth"
      ]

      check {
        type     = "tcp"
        port     = "http"
        interval = "10s"
        timeout  = "30s"
      }
    }

    task "influxdb" {
      driver = "docker"

      config {
        image        = "influxdb:2.7.8-alpine"
        ports        = ["http"]
        network_mode = "host"
      }

      volume_mount {
        volume      = "influxdb-data"
        destination = "/var/lib/influxdb2"
      }

      volume_mount {
        volume      = "influxdb-config"
        destination = "/etc/influxdb2"
      }

      resources {
        cpu    = 500
        memory = 512
      }

      template {
        env         = true
        destination = "secrets/.env"
        data        = <<EOF
{{- with nomadVar "nomad/jobs/influxdb" }}
{{- range .Tuples }}
{{ .K }}={{ .V }}
{{- end }}
{{- end }}        
EOF
      }
    }
  }
}
