provider "google" {
  credentials = file("../../../terraform-credentials-gcplearningwang.json")
  project     = var.project
  region      = var.region
}
