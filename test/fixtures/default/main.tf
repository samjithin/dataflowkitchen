
provider "google" {
  region  = var.region
}

resource "random_id" "random_suffix" {
  byte_length = 4
}

locals {
  gcs_bucket_name = "tmp-dir-bucket-${random_id.random_suffix.hex}"
}

module "dataflow-bucket" {
  source        = "../../../modules/dataflow_bucket"
  name          = local.gcs_bucket_name
  region        = var.region
  project_id    = var.project_id
  force_destroy = var.force_destroy
}

module "dataflow-job" {
  source                = "../../../"
  project_id            = var.project_id
  name                  = "dataflowkitchen"
  on_delete             = "cancel"
  region                = var.region
  zone                  = var.zone
  max_workers           = 1
  template_gcs_path     = "gs://jit/templates/template-name.json"
  temp_gcs_location     = "gs://jit/tmp"
  service_account_email = var.service_account_email
  machine_type          = "n1-standard-1"
  network_self_link     = "mynewnetwork"
  subnetwork_self_link  = "regions/us-central1/subnetworks/mynewnetwork"


  parameters = {
    inputFile = "gs://dataflow-samples/shakespeare/kinglear.txt"
    output    = "gs://jit/output/"
  }
}

