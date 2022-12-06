variable "s3_bucket_names" {
  description = "S3 bucket name"
  type = map(object({
    bucket_name = string
    database_name = string
    tags        = map(string)
  }))
}

variable "force_destroy" {
  description = "Force destroy"
  type        = bool
  default     = true
}