terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"

  #credentials = file("/Users/wang_yuquan/Downloads/root-slate-341702-37e734dc49cb.json")
  credentials = file(var.credentials_file)

  #project = "root-slate-341702"
  #region  = "us-central1"
  #zone    = "us-central1-c"
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}