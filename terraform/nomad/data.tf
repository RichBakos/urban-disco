data "nomad_plugin" "ceph-rbd" {
  plugin_id        = "ceph-rbd"
  wait_for_healthy = true
}

data "nomad_plugin" "cephfs" {
  plugin_id        = "cephfs"
  wait_for_healthy = true
}