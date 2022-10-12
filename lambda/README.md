<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hello_world_function"></a> [hello\_world\_function](#module\_hello\_world\_function) | terraform-aws-modules/lambda/aws | ~> 2.0 |
| <a name="module_lambda_security_group"></a> [lambda\_security\_group](#module\_lambda\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [null_resource.download_package](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_execution_arn"></a> [api\_gateway\_execution\_arn](#input\_api\_gateway\_execution\_arn) | Execution ARN to allow API gateway to call function | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment the resources are assigned to | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Specific project this infrastructure is associated with | `string` | n/a | yes |
<!-- END_TF_DOCS -->