resource "alicloud_nat_gateway" "enhanced" {
  depends_on           = [alicloud_vswitch.vsw]
  vpc_id               = alicloud_vpc.vpc.id
  specification        = "Small"
  nat_gateway_name     = "ng-ocp4"
  payment_type         = "PayAsYouGo"
  vswitch_id           = alicloud_vswitch.vsw.id
  nat_type             = "Enhanced"
}

resource "alicloud_eip" "ng-eip" {
  bandwidth            = "100"
  internet_charge_type = "PayByBandwidth"
}

resource "alicloud_eip_association" "ng_eip_asso" {
  allocation_id = alicloud_eip.ng-eip.id
  instance_id   = alicloud_nat_gateway.enhanced.id
}

resource "alicloud_snat_entry" "ng_snat" {
  depends_on        = [alicloud_eip_association.ng_eip_asso]
  snat_table_id     = alicloud_nat_gateway.enhanced.snat_table_ids
  source_vswitch_id = alicloud_vswitch.vsw.id
  snat_ip           = join(",", alicloud_eip.ng-eip.*.ip_address)
}