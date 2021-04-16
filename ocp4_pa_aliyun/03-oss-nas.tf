resource "alicloud_oss_bucket" "bkt-ocp4" {
  bucket = var.storage.oss.bucket_name
  acl    = "private"
}

resource "alicloud_nas_file_system" "nas-ocp4" {
  protocol_type = "NFS"
  storage_type  = "Capacity"
}