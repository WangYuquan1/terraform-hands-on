module "network" {
  source = "../../modules/network"

  vpc_name                = var.vpc_name
  subnetwork_name         = var.subnetwork_name
  subnet_cidr_range       = var.subnet_cidr_range
  region                  = var.region
  auto_create_subnetworks = var.auto_create_subnetworks
}

module "bastion" {
  source = "../../modules/bastion"

  name            = var.bastion_name
  subnetwork_name = module.network.subnet_name
  machine_type    = "f1-micro"
  region          = var.region
  zone            = var.region_zone
  boot_disk_image = "ubuntu-1804-bionic-v20220308"
  private_ip      = "192.168.10.2"
}