# Set common variables for the environment. This is automatically pulled in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment                          = "nonprod"
  tf_state_storage_resource_group_name = "RG-ELX-Global-Concent-IaC-NonProd"
  tf_state_storage_account_name        = "elxterra4nonprod"
  tf_state_container_name              = "tfstates-nonprod"
}
