# Terraform
Terraform is used to provision infrastructure resources for individual **domain teams**. This directory contains multiple terraform infrastructure stacks which are provisioned per business domain.

## How the code is organized?
Each subdirectory here represents a specific business domain such as [`odl`](odl/) containing its specific infra code. Within a specific business domain, the infrasture code i.e., resource specific terraform files is placed directly in root directory, see an example [here](odl/odl-core/). The resources should ideally be provisioned by calling terraform modules. Please see the list [here](../README.md#provisioning-azure-services).

## How to deploy infrastructure using Terraform?
Since atlantis is used to provision terraform resources and we are using server-side workflows, therefore, each terraform stack must contain `envs` sub-directory similar to [this one](odl/odl-core/envs/).
This envs sub-directory must contain 2 files per environment i.e., `<env>-backend.tfvars` containing backend configuration for hosting statefile for this specific environment and `<env>.tfvars` containing values for variables for this particular environment.

`<env>` must be one of these: `sandbox`, `dev`, `oneint`, `nonprod`, and `prod`. These environments point to following subscriptions:

| Environment | Subscription  | atlantis workflow name |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| sandbox         | ELX-EMEA-Marketing-Sandbox (f28071b5-e402-4c1a-83cc-ed0744ce8e0a) | sandbox_basic_workflow |
| dev         | ELX-GL-Concent-NonProd (4731e47d-991b-4fbd-86aa-1e861607b82f)| dev_basic_workflow |
| oneint         | ELX-GL-Concent-NonProd (4731e47d-991b-4fbd-86aa-1e861607b82f)|oneint_basic_workflow |
| nonprod         | ELX-GL-Concent-NonProd (4731e47d-991b-4fbd-86aa-1e861607b82f)|nonprod_basic_workflow |
| prod         | ELX-GL-Concent-Prod (9a44d85a-3cf1-4938-9509-c8f94b1aee10)|prod_basic_workflow |

The workflows are defined on the server-side and their details can be seen [here](https://dev.azure.com/ELX-Marketing-DevOps/platform-engineering-stack/_git/atlantis?path=/atlantis/envs/prod.tfvars&version=GBmain&line=98&lineEnd=98&lineStartColumn=1&lineEndColumn=31&lineStyle=plain&_a=contents).

Suppose we would like to create infrasturcture for a specific domain team `xyz` in `dev` env. Here are the steps:
- Create `xyz` directory
- Add backend block defining the `key` pointing to the statefile, see [this](odl/odl-core/provider.tf) as an example
- Add terraform code inside the directory ideally calling modules for resource provisioning.
- Create `envs` subdirectory containing `dev-backend.tfvars` and `dev.tfvars` and update them accordingly.
- Ensure plan works fine [locally](#working-with-terraform-locally).
- Update [`atlantis.yaml`](../atlantis.yaml) and add the directory `xyz`. **Be aware, we are using workspaces and there must be 1:1 relationship between workspace and environment.**
- Create a PR and normal atlantis automation should come in play i.e., atlantis should run the plan for you after PR creation, you may ask for review and once PR is mergeable you may then apply the stack.

## Working with terraform locally
In order to work with terraform locally, you must ensure that terraform is installed locally in your machine. You may also choose to use [`tfenv`](https://github.com/tfutils/tfenv) for managing different terraform versions.

You may run the following example commands while inside the right terraform stack. The commands expect that you are already logged in and your user has access to the storage account containing statefile.
````
terraform init -backend-config envs/dev-backend.tfvars
````
````
terraform plan -var-file envs/dev.tfvars
````
````
terraform apply -var-file envs/dev.tfvars
````

## Multiregion domain infra provisioning using terraform
If a terraform stack for a specific business domain needs to be provisioned in multiple regions, we should still use vanilla terraform to keep things simple and to avoid terragrunt complexity. We need to structure the domain specific code as this [example here](https://github.com/kung-foo/multiregion-terraform) i.e., we need to consolidate the domain specific infra in a module type sub-directory and then call it from the parent directory to provision the stack in multiple regions. 

