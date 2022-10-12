output "vpc" {
  value = {
    arn = module.vpc.vpc_arn
    id = module.vpc.vpc_id
    owner_id = module.vpc.vpc_owner_id
    cidr_block = module.vpc.vpc_cidr_block
    ipv6_cidr_block = module.vpc.vpc_ipv6_cidr_block
  }
}

output "database_subnet_group" {
  value = {
    id = module.vpc.database_subnet_group
    name = module.vpc.database_subnet_group_name
  }
}

output "database_subnets" {
  value = {
    ids = module.vpc.database_subnets
    arns = module.vpc.database_subnet_arns
    cidr_blocks = module.vpc.database_subnets_cidr_blocks
    ipv6_cidr_blocks = module.vpc.database_subnets_ipv6_cidr_blocks
  }
}

output "private_subnets" {
  value = {
    ids = module.vpc.private_subnets
    arns = module.vpc.private_subnet_arns
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
    ipv6_cidr_blocks = module.vpc.private_subnets_ipv6_cidr_blocks
  }
}

output "public_subnets" {
  value = {
    ids = module.vpc.public_subnets
    arns = module.vpc.public_subnet_arns
    cidr_blocks = module.vpc.public_subnets_cidr_blocks
    ipv6_cidr_blocks = module.vpc.public_subnets_ipv6_cidr_blocks
  }
}

output "igw" {
  value = {
    arn = module.vpc.igw_arn
    id = module.vpc.igw_id
  }
}

output "nat" {
  value = {
    public_ips = module.vpc.nat_public_ips
    eip_ids = module.vpc.nat_ids
    gw_ids = module.vpc.natgw_ids

  }
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "api_gateway" {
  value = {
    endpoint = module.api_gateway.apigatewayv2_api_api_endpoint
    arn = module.api_gateway.apigatewayv2_api_arn
    execution_arn = module.api_gateway.apigatewayv2_api_execution_arn
    id = module.apigatewayv2_api_id
    authorizer_id = module.apigatewayv2_api_authorizer_id
    invoke_url = module.default_apigatewayv2_stage_invoke_url
  }
}
