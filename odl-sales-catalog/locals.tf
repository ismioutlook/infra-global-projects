locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "ODL"
    product     = "sales catalog"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id       #"d2007bef-127d-4591-97ac-10d72fe28031" 
  subscription_id = data.azurerm_subscription.current.subscription_id #"f28071b5-e402-4c1a-83cc-ed0744ce8e0a" #
  current_user_id = data.azurerm_client_config.current.object_id
  # 75f9a0c1-6e61-4cbe-beba-9ab39034b9a0 ---> CSA-AAD-PRJ-Concent-PE-Admin
  kv_admin_object_ids = ["75f9a0c1-6e61-4cbe-beba-9ab39034b9a0", local.current_user_id, "212ab792-786b-40d4-9cae-3e21087453f2", azurerm_linux_function_app.sales-catalog-ingestion-fap[0].identity[0].principal_id]
  enabled_keyvault    = var.enabled && var.enabled_keyvault ? true : false
  sops_key_name       = format("odl-sopskey-%s", "${terraform.workspace}")
}