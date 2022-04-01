variable "project" {
  default = "heroic-arbor-345902"
}

variable "region" {
  default = "asia-northeast1"
}

variable "region_zone" {
  default = "asia-northeast1-c"
}

variable "vpc_name" {
  default = "terraform-practice-network"
}

variable "auto_create_subnetworks" {
  default = false
}

variable "subnetwork_name" {
  default = "terraform-practice-network-subnet1"
}

variable "subnet_cidr_range" {
  default = "192.168.10.0/24"
}

variable "bastion_name" {
  default = "instance-1"
}

