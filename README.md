# Introduction

The idea of this repository is to have a mono-repo with multiple terraform and terragrunt based stacks to provision and manage Azure cloud resources.  

For both terragrunt and terraform stacks, this repository provisions infrastructure via [atlantis](https://www.runatlantis.io/) which is a pull request automation tool and hosted internally within [Electrolux](https://dev.azure.com/ELX-Marketing-DevOps/platform-engineering-stack/_git/atlantis). For detailed demo of how atlantis works, please watch [this video](https://electrolux-my.sharepoint.com/:v:/p/kamran_manzoor/EbhnEaGlxBFJik5th4CA1KIBMn_UTeVqZMgJc_zxdmwQHQ?referrer=Teams.TEAMS-ELECTRON&referrerScenario=MeetingChicletGetLink.view.view). atlantis config can be seen in [this file](atlantis.yaml).

# General IaC Strategy

We are using both Terraform and Terragrunt for provisioning infrastructure resources. [terraform](terraform/) and [terragrunt](terragrunt/) directories contain the infra for each specific tool. **Terragrunt is mainly used to effectively provision resources/stacks in multiple regions.** Lets discuss about when to use one over the other.

## Terraform
Terraform should be the **defacto choice** for provisioning resources for **domain teams**. The `terraform` directory already contains multiple Terraform infrastructure stacks which are provisioned per business domain. Each business domain has its own statefile. Moreover, please note that we are using workspaces and there is 1:1 relationship between workspace and environment, thus, statefile is per environment within a single stack/project. Please read detailed Terraform documentation and how to work with it [here](terraform/README.md).

## Terragrunt
Terragrunt is a thin wrapper on terraform and in our tooling stack Terragrunt is mainly used to provision and maintain resources across multiple regions. For instance, it is currently used within PE to provision AKS clusters across multiple regions and environments. Since terragrunt adds complexity, therefore, it should be used in a pragmatic way. Please read detailed terragrunt documentation and how to work with it [here](terragrunt/README.md).

## How to Raise a PR
- Before you begin, please read our guidelines about [Terraform](terraform/README.md) and [Terragrunt](terragrunt/README.md).

- You must branch out from `main`, add your changes and raise a PR against `main` branch

- atlantis should run the plan you and display the plan output on your PR. You may also run the plan anytime by commenting `atlantis plan` on your PR.

- Carefully check the plan output, ensure everything looks as expected before you ask for a review.

- Ask for a review. Once the PR gets approved and mergeable conditions get satisfied, you may apply your changes by commenting `atlantis apply <specific stack>`. **DONOT use global `atlantis apply`**. Instead apply in one environment/stack at a time starting from lowest environment. At the end of the plan output, atlantis shows the command to specifically apply that particular plan. Use that command and comment it on your PR.

- **The merge of PR is also controlled by atlantis meaning you must not merge your PRs yourself**. Once the changes get applied by atlantis, your PR will automatically be merged and completed.

## Working with Terraform Modules
Ideally we should be provisioning infrastructure using modules as they provide multiple benefits such as reusability, consistency and testability. We need to be pragmatic in deciding whether we should develop our own custom modules or use opensource ones. General guidelines are mentioned below:

### Opensource terraform modules
- We may use opensource terraform module directly, provided we are careful about a few aspects such as the module is:
  - Opensource and developed by a verified provider like Azure
  - Well maintained (check the latest release date)
  - Small in size with particular scope and does its job well
  - Well tested and widely used by community
  - Comes under permissive opensource licenses like Apache-2.0 and MIT
- For complex components like AKS, we must use Opensource modules provided by verified providers like Azure itself. This is to ensure that we get the updates and maintainability from wider opensource community.

### Custom/in-house developed terraform modules
Following guidelines need to kept in mind for developing terraform modules.
- The module should have its own repository under [infra-modules](https://dev.azure.com/ELX-Marketing-DevOps/infra-modules) project in Azure DevOps.
- For Azure, the module must be named as `terraform-azurerm-<name-of-module>` for instance, `terraform-azurerm-managed-identity`. For existing modules, we may keep their existing names.
- The repo/code structure must be similar to the opensource modules such as [terraform-azurerm-aks](https://github.com/Azure/terraform-azurerm-aks). Few important things to consider:
  - The code should be available on root level
  - There must exists an `examples` folder containing code showing how to consume the module
  - `outputs.tf` must exist to expose the required outputs
- Tests and release pipelines are created
- Documentation, [terraform-docs](https://github.com/terraform-docs/terraform-docs) should be used to autogenerate module documentation
- Only default `main` branch is used as a long lived branch. PRs need to be raised against `main` branch only.
- We should ideally use [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) with autorelease [semantic(https://semver.org/)] versioning. Since we dont currently have the release pipeline, therefore for the timebeing we may use specific HEAD sha hash from `main` branch in the consumer. An example can be [found here](https://dev.azure.com/ELX-Marketing-DevOps/infra-global-projects/_git/infra-global-projects-v1?path=/odl/odl-core/eventgrid.tf&version=GBmain&line=3&lineEnd=4&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents).

## Provisioning Azure Services

In this section, we have provided details about how to provision various Azure components via Terraform and in particular, which Terraform modules should be used. This is work in progress and therefore, should be contributed by all team members

  
| Azure Service          | Recommended Module                                                                                                            | Example Usage                                                                                          |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| Resource Group         | [infra-mod-rg](https://dev.azure.com/ELX-Marketing-DevOps/infra-modules/_git/infra-mod-rg)                                       | [usage examples](https://dev.azure.com/ELX-Marketing-DevOps/infra-modules/_git/infra-mod-rg?path=/examples)                    |
| Virtual network        | [terraform-azurerm-vnet](https://registry.terraform.io/modules/Azure/vnet/azurerm/latest)                                     | [usage examples](https://github.com/Azure/terraform-azurerm-vnet/tree/main/examples)                   |
| Network Security Group | [terraform-azurerm-network-security-group](https://registry.terraform.io/modules/Azure/network-security-group/azurerm/latest) | [usage examples](https://github.com/Azure/terraform-azurerm-network-security-group/tree/main/examples) |
| AKS                    | [terraform-azurerm-aks](https://registry.terraform.io/modules/Azure/aks/azurerm/latest)                                       | [usage examples](https://github.com/Azure/terraform-azurerm-aks/tree/main/examples)                    |
| Keyvault               | [avm-res-keyvault-vault](https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/latest)                   | [usage examples](https://github.com/Azure/terraform-azurerm-avm-res-keyvault-vault/tree/main/examples) |

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
