terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.51.0"
    }
  }
  backend "s3" {
    bucket = "ctyjcytcy"
    region = "us-east-1"
    key = "roboshop-statefiles"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}