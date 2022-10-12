# nelnet-takehome
Take Home Project for Nelnet
Project design diagram available [here](https://app.cloudcraft.co/view/84bf8647-ebd9-40f4-b6ba-c8bf31b585bd?key=b587c368-d569-4f79-a105-1a2d8e11f1fc)

## Project structure
There are two projects in this repo. The `core` directory contains the code for the VPC and API Gateway. This is intented to be used for shared resources. The `lambda` directory contains the code for the specific Lambda endpoint.

There is also a `design` directory containing a static export of the design of this project. Following [This CloudCraft link](https://app.cloudcraft.co/view/84bf8647-ebd9-40f4-b6ba-c8bf31b585bd?key=b587c368-d569-4f79-a105-1a2d8e11f1fc) will be a better experience though.

## Deployment
- Navigate to the appropriate project (Note that the `lambda` project depends on the `core` project.) 
- Select the correct Terraform workspace with `terraform workspace select $env`
- Create and review the Terraform plan `terraform plan -var-file $env.tfvars -out mychange.plan`
- Apply the Terraform plan `terraform apply mychange.plan`

## Credits
This project makes use of [serverless.tf](https://serverless.tf/)
