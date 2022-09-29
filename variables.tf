variable "lakeformation" {
  description = "Lake Formation name"
  type        = string
  default     = "lakeformation-data-archive"
}

variable "lakeformation_s3_bucket" {
  description = "Lake Formation S3 bucket name"
  type        = string
  default     = "lakeformation-data-archive-s3-bucket"
}

variable "athena_database" {
  description = "Athena database name"
  type        = string
  default     = "data_archive"
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

# variable "athena_table_location" {
#   description = "Athena table location"
#     type        = string
#     default     = "s3://lakeformation-data-archive-s3-bucket/data_archive"
# }

