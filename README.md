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