terraform {
  required_version = "1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
  }
}

provider "aws" {
  profile = "terraformKey"
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
    bucket = var.bucket_name

    rule {
      id = "lifecycle teste"
      
      expiration {
        days = 90
      }

      status = "Enabled"

      transition {
        days          = 30
        storage_class = "STANDARD_IA"
      }
  }
}