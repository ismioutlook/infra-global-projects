# Terragrunt

Terragrunt is mainly used to effectively provision infrastructure in multiple regions and environments. The folder structure in this sub-directory is taken as a fork of this [repository](https://github.com/gruntwork-io/terragrunt-infrastructure-live-example). For background information, 
check out the [Keep your code DRY](https://github.com/gruntwork-io/terragrunt#keep-your-terraform-code-dry) 
section of the Terragrunt documentation.

Using Terragrunt, we may deploy infrastructure across multiple environments (dev, oneint, nonprod, prod) and currently two Azure subscriptions (non-prod, prod), all with minimal duplication of code. That's because there is just a single copy of the module code and we solely define
`terragrunt.hcl` files that reference that code (at a specific version, too!) and fill in variables specific to each
environment.

Be sure to read through [the Terragrunt documentation on DRY
Architectures](https://terragrunt.gruntwork.io/docs/features/keep-your-terragrunt-architecture-dry/) to understand the
features of Terragrunt used in this folder organization.


## How the code is organized?

The code in this directory uses the following folder hierarchy:

```
_envcommon
subscription
 └ region
    └ environment
       └ resource
```

Where:

* **_envcommon**: This directory holds common configurations for each component that is shared across the environments. Each file
will be included and merged into the live configuration for the service component in each environment.
* **Subscription**: At the top level are each of the Azure subscriptions, currently `nonprod` (ELX-GL-Concent-NonProd, 4731e47d-991b-4fbd-86aa-1e861607b82f) and `prod` (ELX-GL-Concent-Prod,9a44d85a-3cf1-4938-9509-c8f94b1aee10).

* **Region**: Within each subscription, there will be one or more [Azure
  regions](https://github.com/claranet/terraform-azurerm-regions/blob/master/regions.tf), such as
  `westeurope` and `eastus`, where you've deployed resources.

* **Environment**: Within each region, there will be one or more "environments", such as `dev`, `oneint`, `nonprod`, `prod` etc. 

* **Resource**: Within each environment, there exist all the resources for that environment, such as AKS cluster. Note that the code for most of these resources lives in separate modules.

## How to deploy infrastructure using Terrgrunt?
Lets take an example of provisioning AKS cluster `aks01poccluster` in `eastus` region `nonprod` subcription in `nonprod` environment. We need to:
- Create a sub-directory `eastus` by duplicating to [`westeurope`](nonprod/westeurope/)
- Modify and update `region.hcl`, `env.hcl` and `terragrunt.hcl` files inside `eastus`, `nonprod` and `aks01poccluster` subdirectories respectively with required values. For example, the inputs to AKS module for this particular cluster can be overridden in `terragrunt.hcl` inside `aks01poccluster`.
- Ensure the plan looks good by running the following commands locally by being at the root of this repository:
   ````
   terragrunt init \
    --terragrunt-working-dir terragrunt/nonprod/eastus/nonprod/aks01poccluster \
    --terragrunt-include-external-dependencies
   ````
   ```` 
   terragrunt plan \
      --terragrunt-working-dir terragrunt/nonprod/eastus/nonprod/aks01poccluster \
      --terragrunt-include-external-dependencies
   ````
- Since we are using atlantis for terragrunt provisioning, we need to update [atlantis.yaml](../atlantis.yaml). We may use [this utility](https://github.com/transcend-io/terragrunt-atlantis-config) to get the config automatically. We need to automate this config generation using the pipeline as a second step. Following command should update the file accordingly:
   ````
   terragrunt-atlantis-config generate --output atlantis.yaml --parallel --create-project-name --preserve-projects --automerge --workflow nonprod_terragrunt_workflow --autoplan --terraform-version v1.8.1 --filter terragrunt
   ````
- Now you may create a PR and normal atlantis automation should come in play i.e., atlantis should run the plan for you after PR creation, you may ask for review and once PR is mergeable you may then apply the stack.
- See an example [PR here](https://dev.azure.com/ELX-Marketing-DevOps/infra-global-projects/_git/infra-global-projects-v1/pullrequest/5642).

### Words of caution
- Be very careful while working with terragrunt. For instance, changes to files under `_envcommon` will affect globally i.e., all deployed instances. Check the atlantis plans very carefully.
- The statefile is granular to per component per environment. The directory names are used in the statefile path so renaming is not going to be possible.
- Plan and apply should be per stack. DONOT use `run-all` command