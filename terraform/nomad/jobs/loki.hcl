job "loki" {
  datacenters = ["dc1"]
  type        = "service"

  reschedule {
    attempts       = 5
    interval       = "1h"
    unlimited      = false
    delay          = "5s"
    delay_function = "constant"
  }

  group "loki" {

    network {
      port "http" { static = 3100 }
    }

    volume "loki" {
      type            = "csi"
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
      read_only       = false
      source          = "loki"
    }

    service {
      name = "loki"
      port = "http"

      check {
        port     = "http"
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "loki" {
      driver = "docker"
      user   = "10001:10001"

      config {
        image        = "grafana/loki:2.9.10"
        network_mode = "host"
        ports        = ["http"]
        args = [
          "-config.file",
          "local/loki/local-config.yaml",
        ]
      }

      volume_mount {
        volume      = "loki"
        destination = "/loki"
      }

      template {
        destination = "local/loki/local-config.yaml"
        data        = <<-EOF
        {{- key "homelab/loki/loki.yaml"}}
        EOF
      }

      resources {
        cpu    = 512
        memory = 256
      }
    }
  }
}