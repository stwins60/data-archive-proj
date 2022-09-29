# terraform {
#   cloud {
#     organization = "terraform-test-org-21"

#     workspaces {
#       name = "data-archive"
#     }
#   }
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }

provider "aws" {
  #   region     = "us-east-2"
  #   access_key = aws_access_key
  #   secret_key = aws_secret_key
}