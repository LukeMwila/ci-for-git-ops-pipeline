provider "aws" {
  region = var.region
  profile = var.profile
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "euw1-lfm-gitops-pipeline-terraform-state"
    key = "euw1-lfm-gitops/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}