terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.9.0" # AWS PROVIDER VERSION NOT THE TERRAFORM
    }
  }
}

provider "aws" {
  region = "us-east-1"
}