# Introduction

The idea of this repository is to have a mono-repo with multiple terraform and terragrunt based stacks to provision and manage Azure cloud resources.  

For both terragrunt and terraform stacks, this repository provisions infrastructure via [atlantis](https://www.runatlantis.io/) which is a pull request automation tool and hosted internally within [Electrolux](https://dev.azure.com/ELX-Marketing-DevOps/platform-engineering-stack/_git/atlantis). For detailed demo of how atlantis works, please watch [this video](https://electrolux-my.sharepoint.com/:v:/p/kamran_manzoor/EbhnEaGlxBFJik5th4CA1KIBMn_UTeVqZMgJc_zxdmwQHQ?referrer=Teams.TEAMS-ELECTRON&referrerScenario=MeetingChicletGetLink.view.view). atlantis config can be seen in [this file](atlantis.yaml).

# General IaC Strategy

We are using both terraform and terragrunt for provisioning infrastructure resources. [terraform](terraform/) and [terragrunt](terragrunt/) directories contain the infra for each specific tool. **Terragrunt is mainly used to effectively provision resources/stacks in multiple regions.** Lets discuss about when to use one over the other.

## Terraform
Terraform should be the **defacto choice** for provisioning resources for **domain teams**. The terraform directory already contains multiple terraform infrastructure stacks which are provisioned per business domain. Each business domain has its own statefile. Moreover, please note that we are using workspaces and there is 1:1 relationship between workspace and environment, thus, statefile is per environment within a single stack/project.

### Structure of a specific terraform stack/directory
The infrasture code i.e., resource specific terraform files should be placed directly in root directory, see an example [here](terraform/odl/odl-core/). The resources should ideally be provisioned by calling terraform modules. Please see the list [below](#provisioning-azure-services).

Since atlantis is used to provision terraform resources and we are using server-side workflows, therefore, each terraform stack must contain `envs` sub-directory similar to [this one](terraform/odl/odl-core/envs).
This envs sub-directory should contain 2 files per environment i.e., `<env>-backend.tfvars` containing backend configuration for hosting statefile for this specific environment and `<env>.tfvars` containing values for variables for this particular environment.

`<env>` must be one of these: `sandbox`, `dev`, `oneint`, `nonprod`, and `prod`. These environments point to following subscriptions:

| Environment | Subscription  | atlantis workflow name |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| sandbox         | ELX-EMEA-Marketing-Sandbox (f28071b5-e402-4c1a-83cc-ed0744ce8e0a) | sandbox_basic_workflow |
| dev         | ELX-GL-Concent-NonProd (4731e47d-991b-4fbd-86aa-1e861607b82f)| dev_basic_workflow |
| oneint         | ELX-GL-Concent-NonProd (4731e47d-991b-4fbd-86aa-1e861607b82f)|oneint_basic_workflow |
| nonprod         | ELX-GL-Concent-NonProd (4731e47d-991b-4fbd-86aa-1e861607b82f)|nonprod_basic_workflow |
| prod         | ELX-GL-Concent-Prod (9a44d85a-3cf1-4938-9509-c8f94b1aee10)|prod_basic_workflow |

The workflows are defined on the server-side and their details can be seen [here](https://dev.azure.com/ELX-Marketing-DevOps/platform-engineering-stack/_git/atlantis?path=/atlantis/envs/prod.tfvars&version=GBmain&line=98&lineEnd=98&lineStartColumn=1&lineEndColumn=31&lineStyle=plain&_a=contents).


### Multiregion domain infra provisioning using terraform
If a terraform stack for a specific business domain needs to be provisioned in multiple regions, we should still use vanilla terraform to keep things simple and to avoid terragrunt complexity. We need to structure the domain specific code as this [example here](https://github.com/kung-foo/multiregion-terraform) i.e., we need to consolidate the domain specific infra in a module type sub-directory and then call it from the parent directory to provision the stack in multiple regions. 

### Working with terraform locally
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

## Terragrunt
Terragrunt is a thin wrapper on terraform and in our tooling stack Terragrunt is mainly used to provision and maintain resources across multiple regions. For instance, it is currently used within PE to provision AKS clusters across multiple regions and environments. Since terragrunt adds complexity, therefore, it should be used in a pragmatic way. Please read detailed terragrunt documentation and how to work with it [here](terragrunt/README.md).

## How to Raise a PR
- Before you begin, please read our guidelines about [Terraform](terraform/README.md) and [Terragrunt](terragrunt/README.md).

- You must branch out from `main`, add your changes and raise a PR against `main` branch

- atlantis should run the plan you and display the plan output on your PR. You may also run the plan anytime by commenting `atlantis plan` on your PR.

- Carefully check the plan output, ensure everything looks as expected before you ask for a review.

- Ask for a review. Once the PR gets approved and mergeable conditions get satisfied, you may apply your changes by commenting `atlantis apply <specific stack>`. **DONOT use global `atlantis apply`**. Instead apply in one environment/stack at a time starting from lowest environment. At the end of the plan output, atlantis shows the command to specifically apply that particular plan. Use that command and comment it on your PR.

- **The merge of PR is also controlled by atlantis meaning you must not merge your PRs yourself**. Once the changes get applied by atlantis, your PR will automatically be merged and completed.


## Role Assignments

This is a how-to section about granting accessing to Azure resources to different teams. Following general points **must** be considered:

- The role assignment must be done via **code**. The SPs used in atlantis for both non-prod and prod have access to grant roles.
- Principle of least privilege must be followed. 
- Use a narrow scope, for instance, if AKS access is needed, the scope should be on the cluster/namespace level instead of subscription/resource group level.
- Use AD group names instance of object IDs. Use data source to fetch the corresponding object ID. Please see [here](https://dev.azure.com/ELX-Marketing-DevOps/infra-global-projects/_git/infra-global-projects-v1?path=/main/data.tf&version=GBmain&line=47&lineEnd=48&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents).
- Use existing Azure specified roles where needed as most of the needs can be fulfilled by them. Custom roles may be created on need.

In this repo, the role assignment is already been done for various infra components like AKS and APIM. For AKS, please see [this](https://sdlcwiki.electrolux.com/x/cElKCg) page for the RBAC recommendations.

Once a request comes you need to simply raise a PR and add the respective group to the already existing component like for AKS [here](https://dev.azure.com/ELX-Marketing-DevOps/infra-global-projects/_git/infra-global-projects-v1?path=/main/variables.tf&version=GBmain&line=275&lineEnd=276&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents) or in the [environment specific files](https://dev.azure.com/ELX-Marketing-DevOps/infra-global-projects/_git/infra-global-projects-v1?path=/main/envs).

If the infra component was created manually, we must still do role assignment via **code**. We may use datasource to fetch the resource info and use the information in role assignment.

Here is an [example PR](https://dev.azure.com/ELX-Marketing-DevOps/infra-global-projects/_git/infra-global-projects-v1/pullrequest/5124) to grant API gateway access to ODL developers.

## Provisioning Azure Services

In this section, we have provided details about how to provision various Azure components via terraform in particular, which terraform modules should be used.

| Azure Service          | Recommended Module                                                                                                            | Example Usage                                                                                          |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| Resource Group         | [terraform-azurerm-aks](https://registry.terraform.io/modules/Azure/aks/azurerm/latest)                                       | [usage examples](https://github.com/Azure/terraform-azurerm-aks/tree/main/examples)                    |
| Virtual network        | [terraform-azurerm-vnet](https://registry.terraform.io/modules/Azure/vnet/azurerm/latest)                                     | [usage examples](https://github.com/Azure/terraform-azurerm-vnet/tree/main/examples)                   |
| Network Security Group | [terraform-azurerm-network-security-group](https://registry.terraform.io/modules/Azure/network-security-group/azurerm/latest) | [usage examples](https://github.com/Azure/terraform-azurerm-network-security-group/tree/main/examples) |
| AKS                    | [terraform-azurerm-aks](https://registry.terraform.io/modules/Azure/aks/azurerm/latest)                                       | [usage examples](https://github.com/Azure/terraform-azurerm-aks/tree/main/examples)                    |
| Keyvault               | [avm-res-keyvault-vault](https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/latest)                   | [usage examples](https://github.com/Azure/terraform-azurerm-avm-res-keyvault-vault/tree/main/examples) |

