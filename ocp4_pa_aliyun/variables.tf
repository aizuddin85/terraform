variable "general" {
  default = {
   "aliyun_access_key" = ""
   "aliyun_secret_key" = ""
   "aliyun_region" = "ap-southeast-3" # Kuala Lumpure Region
   "aliyun_zone_id" = "ap-southeast-3a"  #KL Zone A
   "aliyun_zoneb_id" = "ap-southeast-3b" #KL Zone B
   "instance_public_key" = ""
  }
}

variable "network" {
  default ={
    "aliyun_vpcname" = "vpc_ocp4"
    "aliyun_vpccidr" = "192.168.0.0/23"
    "aliyun_vswcidr" = "192.168.0.0/26"
    "aliyun_scgroupname" = "sg_ocp4"
  }
}

variable "aliyun_sgrule_allow_intranet" {
  default = {
      tcp = {
        "allow_http_tcp_intranet" = "80/80"
        "allow_https_tcp_intranet" = "443/443"
        "allow_ocpapi_tcp_intranet" = "6443/6443"
        "allow_ocpmcs_tcp_intranet" = "22623/22623"
        "allow_ssh_tcp_intranet" = "22/22"
        "allow_etcd_tcp_intranet" = "2379/2380"
        "allow_vlxan_geneve_tcp_intranet" = "6081/6081"
        "allow_metrics_intranet" = "1936/1936"
        "allow_hostlevelsvc_tcp_intranet" = "9000/9999"
        "allow_k8sres_tcp_intranet" = "10250/10259"
        "allow_ocpsdn_tcp_intranet" = "10256/10256"
        "allow_nodeport_tcp_intranet" = "30000/32767"
      },
      udp = {
        "allow_vlxan_geneve1_udp_intranet" = "4789/4789"
        "allow_vlxan_geneve2_udp_intranet" = "6081/6081"
        "allow_hostlevelsvc_udp_intranet" = "9000/9999"
        "allow_k8sres_tcp_intranet" = "10250/10259"
        "allow_ocpsdn_tcp_intranet" = "10256/10256"
        "allow_nodeport_udp_intranet" = "30000/32767"
      }
    }
}
/*
variable "aliyun_sgrule_allow_internet" {
  default = {
      tcp = {
        "allow_80_tcp_intranet" = "80/80"
        "allow_443_tcp_intranet" = "443/443"
      }
    }
}
*/
variable "installer_instance" {
  default = {
    settings = { 
      "type" = "ecs.g6.xlarge"
      "system_disk_size" = "30"
      "internet_max_bandwidth_out" = "15"
      "hostname" = "installer"
      "disk_category" = "cloud_efficiency"
      "charge_type" = "PostPaid"
      "image_id" = "centos_8_3_x64_20G_alibase_20210318.vhd" # aliyun ecs DescribeImages --region ap-southeast-3 --RegionId ap-southeast-3 | findstr.exe "ubuntu"
    }
  }
}

variable "pwaccess"  {
      type = string
      description = "Installer instance root password"
      sensitive = true
}