

variable "project_id" {
  type        = string
  description = "The project ID to deploy to"
  default     =  "terraformlearning-284414"

}

variable "region" {
  type        = string
  description = "The region in which the bucket will be deployed"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The zone in which the dataflow job will be deployed"
  default     = "us-central1-a" 
}

variable "service_account_email" {
  type        = string
  description = "The Service Account email used to create the job."
  default     = "dataflow@terraformlearning-284414.iam.gserviceaccount.com" 
}

variable "force_destroy" {
  type        = bool
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  default     = false
}

