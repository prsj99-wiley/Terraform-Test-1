terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

   backend "s3" {
       bucket = "terraform-state-bucket-prsj"
       key    = "global/s3/terraform.tfstate"
       region = "us-east-1"
   }
}



provider "aws" {
  region  = "us-east-1"
}