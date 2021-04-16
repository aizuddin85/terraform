provider "alicloud" {
  access_key = var.general.aliyun_access_key
  secret_key = var.general.aliyun_secret_key
  region     = var.general.aliyun_region
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = var.network.aliyun_vpcname
  cidr_block = var.network.aliyun_vpccidr
}

resource "alicloud_vswitch" "vsw" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = var.network.aliyun_vswcidr
  zone_id           = var.general.aliyun_zone_id
}