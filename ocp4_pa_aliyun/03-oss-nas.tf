resource "alicloud_oss_bucket" "bkt-ocp4" {
  bucket = "bkt-ocp4-isomer2004"
  acl    = "private"
}

resource "alicloud_nas_file_system" "nas-ocp4" {
  protocol_type = "NFS"
  storage_type  = "Capacity"
}