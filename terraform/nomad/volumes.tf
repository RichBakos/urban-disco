resource "nomad_csi_volume" "arcade_config" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "arcade_config"
  name         = "arcade_config"
  capacity_min = "1G"
  capacity_max = "5G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "arcade_data" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "arcade_data"
  name         = "arcade_data"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "vaultwarden" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "vaultwarden"
  name         = "vaultwarden"
  capacity_min = "1G"
  capacity_max = "5G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "flaresolverr" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "flaresolverr"
  name         = "flaresolverr"
  capacity_min = "1G"
  capacity_max = "5G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "grafana" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "grafana"
  name         = "grafana"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "influxdb_config" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "influxdb_config"
  name         = "influxdb_config"
  capacity_min = "1G"
  capacity_max = "5G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "influxdb_data" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "influxdb_data"
  name         = "influxdb_data"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "mongo" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "mongo"
  name         = "mongo"
  capacity_min = "1G"
  capacity_max = "25G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "plex" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "plex"
  name         = "plex"
  capacity_min = "1G"
  capacity_max = "25G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "postgres" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "postgres"
  name         = "postgres"
  capacity_min = "1G"
  capacity_max = "1000G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "prowlarr" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "prowlarr"
  name         = "prowlarr"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "radarr" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "radarr"
  name         = "radarr"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  


resource "nomad_csi_volume" "sonarr" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "sonarr"
  name         = "sonarr"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  


resource "nomad_csi_volume" "jellyfin" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "jellyfin"
  name         = "jellyfin"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  


resource "nomad_csi_volume" "transmission" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "transmission"
  name         = "transmission"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "unifi" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "unifi"
  name         = "unifi"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "wikijs" {
  depends_on = [data.nomad_plugin.ceph-rbd]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "ceph-rbd"
  volume_id    = "wikijs"
  name         = "wikijs"
  capacity_min = "1G"
  capacity_max = "10G"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    userID  = var.ceph_userid
    userKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    pool          = "volumes"
    imageFeatures = "layering"
    mkfsOptions   = "-t ext4"
  }
}  

resource "nomad_csi_volume" "media" {
  depends_on = [data.nomad_plugin.cephfs]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "cephfs"
  volume_id    = "media"
  name         = "media"


  capability {
    access_mode     = "multi-node-multi-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    adminID  = var.ceph_userid
    adminKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    fsName        = "cephfs"
    pool          = "cephfs_data"
    imageFeatures = "layering"
  }
}  

resource "nomad_csi_volume" "certs" {
  depends_on = [data.nomad_plugin.cephfs]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "cephfs"
  volume_id    = "certs"
  name         = "certs"


  capability {
    access_mode     = "single-node-reader-only"
    attachment_mode = "file-system"
  }

  secrets = {
    adminID  = var.ceph_userid
    adminKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    fsName        = "cephfs"
    pool          = "cephfs_data"
    imageFeatures = "layering"
  }
}  

resource "nomad_csi_volume" "hass" {
  depends_on = [data.nomad_plugin.cephfs]

  lifecycle {
    prevent_destroy = true
  }

  plugin_id    = "cephfs"
  volume_id    = "hass"
  name         = "hass"


  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  secrets = {
    adminID  = var.ceph_userid
    adminKey = var.ceph_userkey
  }

  parameters = {
    clusterID     = "820b0f5c-cee3-40a7-b5d5-0aada0355612"
    fsName        = "cephfs"
    pool          = "cephfs_data"
    imageFeatures = "layering"
  }
}





