terraform {
  backend "gcs" {
    bucket      = "terraform-tf-state-20220314"
    prefix      = "terraform/state"
    credentials = "../../../terraform-credentials-gcplearningwang.json"
  }
}
