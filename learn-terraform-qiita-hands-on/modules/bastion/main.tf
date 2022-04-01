variable "name" {}
variable "subnetwork_name" {}
variable "machine_type" {}
variable "region" {}
variable "zone" {}
variable "boot_disk_image" {}
variable "private_ip" {}
variable "service_account" {}

resource "google_compute_address" "bastion" {
  name = var.name
  region = var.region
}

resource "google_compute_instance" "bastion" {
  name = var.name
  machine_type = var.machine_type
  zone = var.zone
  tags = ["server", "bastion"]

  boot_disk {
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/${var.boot_disk_image}"
    }
  }

  network_interface {
    network_ip = var.private_ip
    subnetwork = var.subnetwork_name
    access_config {
      nat_ip = "${google_compute_address.bastion.address}"
    }
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}