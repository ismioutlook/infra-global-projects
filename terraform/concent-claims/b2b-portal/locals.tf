locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "b2b-portal"
  }
}
