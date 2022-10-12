variable "env" {
  type        = string
  description = "Environment the resources are assigned to"
}

variable "project_name" {
  type        = string
  description = "Specific project this infrastructure is associated with"
}

variable "api_gateway_execution_arn" {
  type        = string
  description = "Execution ARN to allow API gateway to call function"
}
