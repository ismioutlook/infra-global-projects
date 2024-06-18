# Introduction

This repository is structured for a Global Terraform project that provisions and manages Azure cloud resources. This repository provisions infrastructure via [atlantis](https://www.runatlantis.io/) which is a terraform pull request automation tool and hosted internally within Electrolux. For detailed demo of how atlantis works, please watch [this video](https://electrolux-my.sharepoint.com/:v:/p/kamran_manzoor/EbhnEaGlxBFJik5th4CA1KIBMn_UTeVqZMgJc_zxdmwQHQ?referrer=Teams.TEAMS-ELECTRON&referrerScenario=MeetingChicletGetLink.view.view). **Moreover, please note that we are using workspaces and there is 1:1 relationship between workspace and environment.**

* `main/` : This directory contains the main Terraform stack. Each file in this stack corresponds to a specific Azure resource or set of related resources.

    - `acr.tf`: Defines Azure Container Registry resources.
    * `aks_eu.tf`: Defines Azure Kubernetes Service resources for the EU region.
    * `apim.tf`: Defines Azure API Management resources.
    * `appgw_eu.tf`: Defines Azure Application Gateway resources for the EU region.
    * `app_insights_eu.tf`: Defines Azure Application Insights resources for the EU region.
    * `data.tf`: Defines data sources used in the Terraform configurations.
    * `nsg_eu.tf`: Defines Network Security Group resources for the EU region.
    * `provider.tf`: Configures the Azure provider for Terraform.
    * `rg_eu.tf`: Defines Resource Group resources for the EU region.
    * `variables.tf`: Defines variables used in the Terraform configurations.

## How to Raise a Change

If you want to change the existing infra, you should raise a PR against `main` branch and collaborate on the PR. **The merge of PR is also controlled by atlantis meaning you must not merge your PRs yourself**. 

If you want to define a new terraform stack, you need to create a directory like [main](main/) which must contain the same structure with [envs](main/envs/) subdirectory containing env specific conf files. You then need to update [atlantis.yaml](atlantis.yaml) file and add the new stack there. **Be aware, we are using workspaces and there is 1:1 relationship between workspace and environment.**

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