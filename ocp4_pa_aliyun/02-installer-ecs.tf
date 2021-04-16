// Import an existing public key to build a alicloud key pair
resource "alicloud_key_pair" "publickey" {
  key_pair_name   = "general_public_key"
  public_key = var.general.instance_public_key
}

resource "alicloud_instance" "installer" {
  availability_zone          = var.general.aliyun_zone_id
  host_name                  = var.installer_instance.settings.hostname
  instance_charge_type       = var.installer_instance.settings.charge_type
  security_groups            = alicloud_security_group.sggroup.*.id
  instance_type              = var.installer_instance.settings.type
  system_disk_category       = var.installer_instance.settings.disk_category
  system_disk_size           = var.installer_instance.settings.system_disk_size 
  image_id                   = var.installer_instance.settings.image_id
  instance_name              = var.installer_instance.settings.hostname
  vswitch_id                 = alicloud_vswitch.vsw.id
  internet_max_bandwidth_out = var.installer_instance.settings.internet_max_bandwidth_out
  password                   = var.pwaccess
}

resource "alicloud_ecs_key_pair_attachment" "kp-attach" {
  key_pair_name = "general_public_key"
  instance_ids  = [alicloud_instance.installer.id]
}