terraform {
  /*backend "remote" {
    hostname = "app.terraform.io"
    organization = "silvicazu"

    workspaces {
      name = "terra-house-1"
    }
  }*/
  
   cloud {
    organization = "silvicazu"

    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  } 
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
}

#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {

  lower = true
  upper = false
  length  = 32
  special = false

}

output "random_bucket_name"{
  value = random_string.bucket_name.id   
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "example" {
# Bucket Naming Rules
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result
}

output "random_bucket_name_id"{
  value = random_string.bucket_name.id   
}

output "random_bucket_name_result"{
  value = random_string.bucket_name.result   
}



