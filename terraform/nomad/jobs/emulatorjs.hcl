job "emulatorjs" {
  type = "service"

  group "emulatorjs" {

    network {
      port "http" {
        to = 80
      }

      port "admin" {
        to = 3000
      }
    }

    volume "arcade_config" {
      type   = "host"
      source = "arcade_config"
    }

    volume "arcade_data" {
      type   = "host"
      source = "arcade_data"
    }

    service {
      name     = "arcade"
      port     = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.arcade.entrypoints=websecure",
        "traefik.http.routers.arcade.middlewares=auth"
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }        
    }

    service {
      name     = "arcade-admin"
      port     = "admin"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.arcade-admin.entrypoints=websecure",
        "traefik.http.routers.arcade-admin.middlewares=auth"
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }          
    }    

    task "emulatorjs" {
      driver = "docker"

      config {
        image        = "lscr.io/linuxserver/emulatorjs:latest"
        network_mode = "bridge"
        ports        = ["http", "admin"]
      }

      volume_mount {
        volume      = "arcade_config"
        destination = "/config"
      }

      volume_mount {
        volume      = "arcade_data"
        destination = "/data"
      }   

      env {
        PUID = "1000"
        PGID = "1000"
        TZ   = "Etc/UTC"
      }

      resources {
        cpu = 2000
        memory = 2048
      }
    }
  }
}