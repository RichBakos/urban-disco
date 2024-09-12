job "mongo" {
  type     = "service"

  constraint {
    attribute = "${attr.unique.hostname}"
    value     = "client03"
  }

  group "mongo" {

    network {
      port "mongo" { static = "27017" }
    }

    volume "mongo" {
      type   = "host"
      source = "mongo"
    }

    service {
      name = "mongo"
      port = "mongo"
    }

    task "mongo" {
      driver = "docker"

      config {
        image        = "docker.io/mongo:7.0.14"
        network_mode = "host"
        ports        = ["mongo"]
        volumes = [
          "/mnt/volumes/mongo/init-mongo.sh:/docker-entrypoint-initdb.d/init-mongo.sh:ro",
        ]
      }

      volume_mount {
        volume      = "mongo"
        destination = "/data/db"
      }

      resources {
        cpu    = 500
        memory = 512
      }

      template {
        env         = true
        destination = "secrets/mongo.env"
        data        = <<-EOF
        {{- with nomadVar "nomad/jobs/mongo" }}
          {{- range .Tuples }}
            {{ .K }}={{ .V }}
          {{- end }}
        {{- end }}
        EOF
      }      
    }
  }
}
