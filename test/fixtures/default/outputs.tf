

output "project_id" {
  value       = var.project_id
  description = "The project's ID"
}

output "region" {
  description = "The region used when managing resources."
  value       = var.region
}

output "df_job_state" {
  description = "The state of the newly created Dataflow job"
  value       = module.dataflow-job.state
}

output "df_job_id" {
  description = "The unique Id of the newly created Dataflow job"
  value       = module.dataflow-job.id
}

output "df_job_name" {
  description = "The name of the newly created Dataflow job"
  value       = module.dataflow-job.name
}

output "bucket_name" {
  description = "The name of the bucket"
  value       = module.dataflow-bucket.name
}

#output "bucket_url" {
#  description = "The name of the bucket"
##  value       = module.dataflow-bucket.name
#}


