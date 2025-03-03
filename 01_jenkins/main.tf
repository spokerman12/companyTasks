provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "eu-west-1"
}

resource "aws_s3_bucket" "default" {
    bucket = "default"
}

