module "network" {
  source = "../../modules/network"

  vpc_name                = var.vpc_name
  subnetwork_name         = var.subnetwork_name
  subnet_cidr_range       = var.subnet_cidr_range
  region                  = var.region
  auto_create_subnetworks = var.auto_create_subnetworks
}