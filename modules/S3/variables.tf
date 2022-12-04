variable "s3_bucket_names" {
  description = "S3 bucket name"
  type        = list(any)
  default     = ["lakeformation-data-archive-s3-bucket"]
}

variable "force_destroy" {
  description = "Force destroy"
  type        = bool
  default     = true
}