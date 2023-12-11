terraform {
  backend "s3" {
    bucket = "prsj-bucket2"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}


# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#     }
#   }

#   required_version = ">= 0.14.9"

#   backend "s3" {
#     bucket = "terraform-state-bucket-prsj"
#     key    = "global/s3/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

# provider "aws" {
#   version = ">= 3.0"
#   region  = "us-east-1"
# }