client {

  host_volume "arcade_config" {
    path      = "/mnt/volumes/arcade/config"
    read_only = false
  }

  host_volume "arcade_data" {
    path      = "/mnt/volumes/arcade/data"
    read_only = false
  }

  host_volume "bitwarden" {
    path      = "/mnt/volumes/bitwarden"
    read_only = false
  }

	host_volume "cannery" {
    path      = "/mnt/volumes/cannery"
    read_only = false
  }

  host_volume "docker-sock-ro" {
    path = "/var/run/docker.sock"
    read_only = true
  }  

  host_volume "flaresolverr" {
    path      = "/mnt/volumes/flaresolverr"
    read_only = false
  }	

  host_volume "home-assistant" {
    path      = "/mnt/volumes/home-assistant"
    read_only = false
  }

  host_volume "grafana" {
    path      = "/mnt/volumes/grafana"
    read_only = false
  }	

  host_volume "influxdb-config" {
    path      = "/mnt/volumes/influxdb/config"
    read_only = false
  }	

  host_volume "influxdb-data" {
    path      = "/mnt/volumes/influxdb/data"
    read_only = false
  }	

  host_volume "loki" {
    path      = "/mnt/volumes/loki"
    read_only = false
  }	

	host_volume "media" {
    path      = "/mnt/media"
    read_only = false
  }

  host_volume "mongo" {
    path      = "/mnt/volumes/mongo/data/db"
    read_only = false
  }	

  host_volume "mass" {
    path      = "/mnt/volumes/mass"
    read_only = false
  }	

  host_volume "plex" {
    path      = "/mnt/volumes/plex"
    read_only = false
  }

  host_volume "postgres" {
    path      = "/mnt/volumes/postgres"
    read_only = false
  }	

  host_volume "prometheus" {
    path      = "/mnt/volumes/prometheus"
    read_only = false
  }

  host_volume "prowlarr" {
    path      = "/mnt/volumes/prowlarr"
    read_only = false
  }

  host_volume "radarr" {
    path      = "/mnt/volumes/radarr"
    read_only = false
  }

  host_volume "sabnzbd" {
    path      = "/mnt/volumes/sabnzbd"
    read_only = false
  }	

  host_volume "samba" {
    path      = "/mnt/volumes/samba"
    read_only = false
  }

  host_volume "sonarr" {
    path      = "/mnt/volumes/sonarr"
    read_only = false
  }

  host_volume "certs" {
    path      = "/mnt/volumes/certs"
    read_only = false
  }

  host_volume "jellyfin" {
    path      = "/mnt/volumes/jellyfin/cache"
    read_only = false
  }
  
  host_volume "redis" {
    path      = "/mnt/volumes/redis"
    read_only = false
  }	

  host_volume "transmission" {
    path      = "/mnt/volumes/transmission"
    read_only = false
  }	

  host_volume "unifi" {
    path      = "/mnt/volumes/unifi"
    read_only = false
  }	

  host_volume "vector" {
    path      = "/mnt/volumes/vector"
    read_only = false
  }	

  host_volume "wikijs" {
    path      = "/mnt/volumes/wikijs"
    read_only = false
  }	
}