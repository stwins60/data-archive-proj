terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "terraform-test-org-21"
    workspaces {
      prefix = "data-"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}