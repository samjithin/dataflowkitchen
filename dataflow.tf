resource "google_dataflow_job" "dataflow_job" {
  project               = var.project_id
  name                  = var.name
  zone                  = var.zone
  template_gcs_path     = var.template_gcs_path
  temp_gcs_location     = var.temp_gcs_location
  service_account_email = var.service_account_email
  parameters            = var.parameters
  on_delete             = var.on_delete
  max_workers           = var.max_workers
  machine_type          = var.machine_type
  #ip_configuration      = var.ip_configuration
  network               = var.network_self_link
  subnetwork            = var.subnetwork_self_link
}
