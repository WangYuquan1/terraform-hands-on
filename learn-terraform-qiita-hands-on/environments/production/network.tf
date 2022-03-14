resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks

}

resource "google_compute_subnetwork" "vpc_subnet1" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnet_cidr_range
  network       = google_compute_network.vpc.name
  description   = "example.subnet1"
  region        = var.region
}
