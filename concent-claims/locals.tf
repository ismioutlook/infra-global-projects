locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "concent-claims"
  }
}