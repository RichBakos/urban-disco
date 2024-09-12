job "grafana" {
  type = "service"

  group "grafana" {

    network {
      port "http" {
        to = 3000
      }
    }

    volume "grafana" {
      type   = "host"
      source = "grafana"
    }

    service {
      name = "grafana"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.grafana.entrypoints=websecure",
        "traefik.http.routers.grafana.middlewares=auth"
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "grafana" {
      driver = "docker"
      user   = 1000

      config {
        image        = "grafana/grafana-oss:11.1.3"
        network_mode = "bridge"
        ports        = ["http"]
      }

      volume_mount {
        volume      = "grafana"
        destination = "/var/lib/grafana"
      }

      resources {
        cpu    = 200
        memory = 256
      }

      template {
        destination = "secrets/grafana.env"
        env         = true
        data        = <<EOF
{{- with nomadVar "nomad/jobs/grafana" }}
{{- range .Tuples }}
{{ .K }}={{ .V }}
{{- end }}
{{- end }}
EOF
      }
    }
  }
}