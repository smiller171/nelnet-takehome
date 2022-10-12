variable "env" {
  type = string
  description = "Environment the resources are assigned to"
}

variable "vpc_cidr" {
  type = string
  description = "What CIDR is the VPC assigned?"
}

variable "project_name" {
  type = string
  description = "Specific project this infrastructure is associated with"
}

locals {
  az_cidrs = cidrsubnets(vpc_cidr, 2, 2, 2, 2)
}
