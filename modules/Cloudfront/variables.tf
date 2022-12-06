#variable "s3_bucket_names" {
#  description = "S3 bucket name"
#  type        = list(any)
#  default     = ["lakeformation-data-archive-s3-bucket"]
#}
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

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "example.com"
}