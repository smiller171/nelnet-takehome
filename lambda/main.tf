provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      environment = var.env
      project     = var.project_name
    }
  }
}

locals {
  package_url = "https://raw.githubusercontent.com/terraform-aws-modules/terraform-aws-lambda/master/examples/fixtures/python3.8-zip/existing_package.zip"
  downloaded  = "downloaded_package_${md5(local.package_url)}.zip"
}

resource "null_resource" "download_package" {
  triggers = {
    downloaded = local.downloaded
  }

  provisioner "local-exec" {
    command = "curl -L -o ${local.downloaded} ${local.package_url}"
  }
}


# TODO: Use tf remote state rather than data lookups

data "aws_vpc" "this" {
  tags = {
    environment = var.env
  }
}

data "aws_subnets" "private" {
  tags = {
    environment = var.env
    subnet_type = "private"
  }
}

module "lambda_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "hello_world"
  description = "Lambda security group for example usage"
  vpc_id      = data.aws_vpc.this.id

  egress_rules = ["all-all"]
}

module "hello_world_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 2.0"

  function_name = "hello_world"
  description   = "basic lambda to show function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  publish = true

  create_package         = false
  local_existing_package = local.downloaded

  attach_network_policy  = true
  vpc_subnet_ids         = data.aws_subnets.ids
  vpc_security_group_ids = [module.lambda_security_group.security_group_id]

  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = "${var.api_gateway_execution_arn}/*/*/*"
    }
  }
}

# TODO: add API Gateway integration
