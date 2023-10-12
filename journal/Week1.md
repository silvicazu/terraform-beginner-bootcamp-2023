
#Terraform Beginner bootcamp 2023 

## Root Module Structure

Our root module structure is as follows:
- PROJECT_ROOT
  - variables.tf: stores the structure of input variables.
  - main.tf : everithing else.
  - providers.tf : defined requiered providers and their configuration.
  - outputs.tf: stores our outputs.
  - terraform.tfvars : the data of variables we want to load into our terraform project.
  - README.MD : requiered for root modules.

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
