terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "terraform-test-org-21"
    workspaces {
      prefix = "dataArchive-"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  secret_key = var.aws_secret_access_key
  access_key = var.aws_access_key_id
}