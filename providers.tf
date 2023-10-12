terraform {
  /*backend "remote" {
    hostname = "app.terraform.io"
    organization = "silvicazu"

    workspaces {
      name = "terra-house-1"
    }
  }
  
   cloud {
    organization = "silvicazu"

    workspaces {
      name = "terra-house-1"
    }
  }*/

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  } 
}