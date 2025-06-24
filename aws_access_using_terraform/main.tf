terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws" # Specify the source of the AWS provider
        version = "~> 5.0" # Specify the version of the AWS provider
        }
    }
    
    required_version = ">= 1.0" # Specify the required version of Terraform
}
provider "aws" {
  region = "us-east-1"
}

