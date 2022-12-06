variable "lakeformation" {
  description = "Lake Formation name"
  type        = string
  default     = "lakeformation-data-archive"
}

variable "s3_bucket_names" {
  description = "S3 bucket name"
  type = map(object({
    bucket_name = string
    database_name = string
    tags        = map(string)
  }))
}

variable "athena_database_names" {
  description = "Athena database name"
  type        = list(any)
  default     = ["data_archive"]
}

variable "athena_table" {
  description = "Athena table name"
  type        = string
  default     = "data_archive"
}

variable "athena_workgroup" {
  description = "Athena workgroup name"
  type        = string
  default     = "data_archive"
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

#variable "aws_secret_access_key" {
#  description = "value of aws_secret_access_key"
#}
#
#variable "aws_access_key_id" {
#  description = "value of aws_access_key_id"
#}



# variable "athena_table_location" {
#   description = "Athena table location"
#     type        = string
#     default     = "s3://lakeformation-data-archive-s3-bucket/data_archive"
# }

