locals {
  buckets = []
}

provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "eu-west-1"
}

module "self_service" {
  source = "./self_service"
  buckets = locals.buckets
}