provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      environment = var.env
      project     = var.project_name
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.16"

  name                            = var.env
  cidr                            = var.vpc_cidr
  enable_nat_gateway              = true
  enable_vpn_gateway              = true
  enable_ipv6                     = true
  assign_ipv6_address_on_creation = true

  azs = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d"
  ]

  private_subnets = [
    for block in az_cidrs : cidrsubnet(block, 2, 0)
  ]

  private_subnet_tags = {
    subnet_type = "private"
  }

  public_subnets = [
    for block in az_cidrs : cidrsubnet(block, 2, 1)
  ]

  public_subnet_tags = {
    subnet_type = "private"
  }

  database_subnets = [
    for block in az_cidrs : cidrsubnet(block, 2, 2)
  ]

  database_subnet_tags = {
    subnet_type = "private"
  }
}

module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name          = "${var.env}-http"
  description   = "HTTP API Gateway"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_methods = ["*"]
    allow_origins = ["*"]

    allow_headers = [
      "content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"
    ]
  }

  # TODO: Add domain settings
  # TODO: Add access logs settings
}
