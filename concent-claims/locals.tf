locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "concent-claims"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
  # kv_reader_objects_ids = var.enabled ? concat(var.kv_policy_objects_ids.reader_objects_ids, module.data_factory[0].adf_identity[*].principal_id) : []
  kv_reader_objects_ids = var.enabled ? var.kv_policy_objects_ids.reader_objects_ids : []
  kv_admin_objects_ids  = var.enabled ? var.kv_policy_objects_ids.admin_objects_ids : []
}