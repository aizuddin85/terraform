resource "alicloud_security_group" "sggroup" {
  name   = var.network.aliyun_scgroupname
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "sggroup_tcp_allow_intranet" {
  for_each = var.aliyun_sgrule_allow_intranet.tcp

  description       = each.key
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = each.value
  priority          = 1
  security_group_id = alicloud_security_group.sggroup.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "sggroup_udp_allow_intranet" {
  for_each = var.aliyun_sgrule_allow_intranet.udp

  description       = each.key
  type              = "ingress"
  ip_protocol       = "udp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = each.value
  priority          = 1
  security_group_id = alicloud_security_group.sggroup.id
  cidr_ip           = "0.0.0.0/0"
}
resource "alicloud_security_group_rule" "sggroup_icmp_allow" {
  description       = "allow_icmp_intranet"
  type              = "ingress"
  ip_protocol       = "icmp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "-1/-1"
  priority          = 1
  security_group_id = alicloud_security_group.sggroup.id
  cidr_ip           = "0.0.0.0/0"
}