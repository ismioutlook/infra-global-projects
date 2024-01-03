# Introduction

This workspace is structured for a Global Terraform project that provisions and manages Azure cloud resources. The project is organized into several directories and files, each with a specific purpose.

## Directory Structure
* `data/` : This directory contains variable files for different environments. These files are used to provide environment-specific values to the Terraform configurations.
    * `values_nonprod.tfvars` : Contains variable values for the non-production environment.
    * `values_prod.tfvars` : Contains variable values for the production environment.

* `main/` : This directory contains the main Terraform configuration files. Each file corresponds to a specific Azure resource or set of related resources.

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

* `pipeline/`: This directory contains files related to the CI/CD pipeline.

## How to Use

Follow these steps to set up your own Global Terraform project for managing Azure cloud resources.

**Step 1: Create a New Repository**

Start by creating a new repository in new project or same project. 

**Step 2: Set Up the Directory Structure**

Next, set up the directory structure in your new repository. Create the following directories:

* `data/`: This will hold variable files for different environments.
* `main/`: This will contain the main Terraform configuration files.
* `pipeline/`: This will contain files related to the CI/CD pipeline.

**Step 3: Add Your Resources**

Now, you can start adding your resources. Each resource should be defined in a separate Terraform configuration file in the `main/` directory. The file should be named after the resource it defines (e.g., `acr.tf` for Azure Container Registry resources).

**Step 4: Check for Resource-Related Modules**

Before you can use a resource in your Terraform configuration, you need to make sure that the corresponding Terraform module is available. If it's not, you'll need to add it. You can find Terraform modules for Azure resources available in our [infra-module](https://dev.azure.com/ELX-Marketing-DevOps/infra-modules) project .

**Step 5: Define Variables**

In the `main/` directory, create a file named `variables.tf`. This file should define all the variables that your Terraform configurations will use. You can then provide values for these variables in .tfvars files in the `data/` directory.

* ***Note***

    * `In large-scale infrastructure, it's common to manage multiple Azure subscriptions or tenants. This complex object allows for a more organized and structured approach to defining and passing these details.`
    * `It provides clarity and makes it easier to maintain the code. When your infrastructure grows in complexity, having a well-defined structure for your variables can significantly reduce confusion and errors.`
    * `It allows for greater flexibility in how you structure and pass your configuration data. You could easily extend this object to include more attributes if needed in the future.`

For our global solution Terraform project we have used Variable of Complex, nested object type. For Example,

```
variable "subscription" {
  type = object({
    subscription = object({
      tenant_id       = string
      subscription_id = string
    })
  })
}
```

**Step 6: Configure the Azure Provider**
In the `main/` directory, create a file named `provider.tf`. This file should configure the Azure provider for Terraform. You'll need to provide your Azure subscription ID, tenant ID, client ID, and client secret.

```
terraform {

  required_version = ">=1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id            = var.subscription.subscription.subscription_id
  tenant_id                  = var.subscription.subscription.tenant_id
  skip_provider_registration = "true"
}
```

**Step 7: Run Pipeline**

Once we done with all template make sure we add YAML pipeline in `pipeline/` directory. We dont need to make any changes in `pipeline.yaml` file. Everything has been taken care from [OneYamlPipeline](https://dev.azure.com/ELX-Marketing-DevOps/Electrolux-Scripts/_git/TheOneYAMLPipeline) backend template templates. Please use [OneYamlPipeline Model](https://sdlcwiki.electrolux.com/display/daotpt/The+One+YAML+Pipeline+Model) confluence page for understanding pipeline template.

## Important Note

* ***Remember to commit and push your changes to the repository regularly. This will ensure that your work is saved and can be shared with others.***

* ***Always use branching strategy instead of pushing code direct to main/master branch.***

* ***Always use Feature branch to apply new changes.***
