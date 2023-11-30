resource "azurerm_network_security_group" "nsg_apim" {
  location            = var.eu_vars.resource_group.resource_group_location
  resource_group_name = var.eu_vars.resource_group.resource_group_name
  name                = "nsg-apim-gl-nonprod"

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "*"
    direction                  = "Inbound"
    name                       = "Azure_Infrastructure_Load_Balancer"
    priority                   = 180
    protocol                   = "Tcp"
    source_address_prefix      = "AzureLoadBalancer"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "GatewayManager"
    destination_port_range     = "65503-65534"
    direction                  = "Inbound"
    name                       = "AllowTrafficForHealthCheck"
    priority                   = 380
    protocol                   = "Tcp"
    source_address_prefix      = "Internet"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "AzureKeyVault"
    destination_port_range     = "443"
    direction                  = "Outbound"
    name                       = "AllowTagForAccesstoKeyVault"
    priority                   = 330
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "GatewayManager"
    destination_port_ranges    = ["80", "443"]
    direction                  = "Inbound"
    name                       = "AllowTagForAPIMToGatewayManager"
    priority                   = 370
    protocol                   = "Tcp"
    source_address_prefix      = "ApiManagement"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "65200-65535"
    direction                  = "Inbound"
    name                       = "AllowInboundRangeForTrafficeManager"
    priority                   = 350
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    description                = "APIM Logs and Metrics for consumption by admins and your IT team are all part of the management plane"
    destination_address_prefix = "AzureMonitor"
    destination_port_ranges    = ["1886", "443", "12000"]
    direction                  = "Outbound"
    name                       = "Publish_DiagnosticLogs_And_Metrics"
    priority                   = 185
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "EventHub"
    destination_port_range     = "5671"
    direction                  = "Outbound"
    name                       = "Dependency_for_Log_to_event_Hub_policy"
    priority                   = 150
    protocol                   = "*"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "Sql"
    destination_port_range     = "1443"
    direction                  = "Outbound"
    name                       = "AllowAnySQLOutbound"
    priority                   = 340
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "3443"
    direction                  = "Inbound"
    name                       = "AllowAPIMToTrafficeManager"
    priority                   = 360
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Secure_Client_communication_to_API_Management"
    priority                   = 110
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "53"
    direction                  = "Outbound"
    name                       = "Allow_DNS_Communication"
    priority                   = 105
    protocol                   = "*"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "Internet"
    destination_port_range     = "*"
    direction                  = "Outbound"
    name                       = "Allow_Internet_Outbound"
    priority                   = 110
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "6390"
    direction                  = "Inbound"
    name                       = "AllowTagForInfraLoadBalancer"
    priority                   = 310
    protocol                   = "*"
    source_address_prefix      = "AzureLoadBalancer"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "Sql"
    destination_port_range     = "1433"
    direction                  = "Outbound"
    name                       = "Dependency_on_Azure_SQL"
    priority                   = 140
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    description                = "Connect to Azure Active Directory for Developer Portal Authentication or for Oauth2 flow during any Proxy Authentication"
    destination_address_prefix = "AzureActiveDirectory"
    destination_port_ranges    = ["80", "443"]
    direction                  = "Outbound"
    name                       = "Authenticate_To_Azure_Active_Directory"
    priority                   = 200
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "AzureCloud"
    destination_port_range     = "443"
    direction                  = "Outbound"
    name                       = "Publish_Monitoring_Logs"
    priority                   = 300
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    description                = "APIM service dependency on Azure Blob and Azure Table Storage"
    destination_address_prefix = "Storage"
    destination_port_ranges    = ["80", "443"]
    direction                  = "Outbound"
    name                       = "Dependency_on_Azure_Storage"
    priority                   = 100
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "Storage"
    destination_port_range     = "443"
    direction                  = "Outbound"
    name                       = "Dependency_on_Azure_File_Share_for_GIT"
    priority                   = 170
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "3443"
    direction                  = "Inbound"
    name                       = "Management_endpoint_for_Azure_portal_and_Powershell"
    priority                   = 120
    protocol                   = "Tcp"
    source_address_prefix      = "ApiManagement"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_ranges    = ["80", "443"]
    direction                  = "Inbound"
    name                       = "Client_communication_to_API_Management"
    priority                   = 100
    protocol                   = "Tcp"
    source_address_prefix      = "Internet"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    description                = "APIM features the ability to generate email traffic as part of the data plane and the management plane"
    destination_address_prefix = "Internet"
    destination_port_ranges    = ["587", "25", "25028"]
    direction                  = "Outbound"
    name                       = "Connect_To_SMTP_Relay_For_SendingEmails"
    priority                   = 190
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "6381-6385"
    direction                  = "Inbound"
    name                       = "Dependency_on_Redis_Cache"
    priority                   = 130
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "AllowTagForTrafficManagerRouting"
    priority                   = 320
    protocol                   = "Tcp"
    source_address_prefix      = "AzureTrafficManager"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "6381-6395"
    direction                  = "Outbound"
    name                       = "Dependency_on_Redis_Cache_outbound"
    priority                   = 160
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }
  depends_on = [ module.eu_gl_rg ]
}

resource "azurerm_network_security_group" "nsg_apim_gw" {
  location            = var.eu_vars.resource_group.resource_group_location
  resource_group_name = var.eu_vars.resource_group.resource_group_name
  name                = "nsg-gw-gl-nonprod"

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_AKAMAI_Staging_Siteshield_HTTPS"
    priority                   = 150
    protocol                   = "Tcp"
    source_address_prefixes    = ["104.102.248.0/24", "23.50.55.49/32"]
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "GatewayManager"
    destination_port_range     = "65200-65535"
    direction                  = "Inbound"
    name                       = "AllowTagCustom65200-65535Inbound"
    priority                   = 200
    protocol                   = "Tcp"
    source_address_prefix      = "Internet"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "AllowInternetTrafficForApplicationgateway"
    priority                   = 210
    protocol                   = "Tcp"
    source_address_prefix      = "Internet"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_AKAMAI_SiteShield_HTTPS"
    priority                   = 120
    protocol                   = "Tcp"
    source_address_prefixes    = ["23.15.178.0/24", "96.7.74.0/24", "104.102.248.0/24", "95.101.79.0/24", "23.56.236.0/24", "95.100.169.0/24", "92.123.142.0/24", "23.33.28.0/24", "23.218.248.0/24", "95.101.78.0/24", "23.15.177.0/24", "2.19.119.0/24", "23.48.94.0/24", "2.17.112.0/24", "92.123.122.0/24", "23.217.99.0/24", "92.123.71.0/24", "23.72.255.0/24", "168.143.242.0/24", "95.100.97.0/24", "23.198.13.0/24", "96.7.218.0/24", "23.64.120.0/24", "184.25.204.0/24", "168.143.243.0/24"]
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_Bastion_Hosts"
    priority                   = 160
    protocol                   = "Tcp"
    source_address_prefix      = "AzureCloud.WestEurope"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "65200-65535"
    direction                  = "Inbound"
    name                       = "AllowInboundRangeForTrafficeManager"
    priority                   = 180
    protocol                   = "Tcp"
    source_address_prefix      = "GatewayManager"
    source_port_range          = "*"
  }

  security_rule {
    access                       = "Allow"
    destination_address_prefixes = ["52.166.38.175", "10.219.5.232"]
    destination_port_range       = "65200-65535"
    direction                    = "Outbound"
    name                         = "AllowHealthProbesOutbound"
    priority                     = 100
    protocol                     = "*"
    source_address_prefix        = "*"
    source_port_range            = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "65200-65535"
    direction                  = "Inbound"
    name                       = "AllowHealthProbes"
    priority                   = 110
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    description                = "INC6252691"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_SAP_C4C"
    priority                   = 170
    protocol                   = "Tcp"
    source_address_prefix      = "157.133.170.72"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_Zscaler_EMEA_HTTPS"
    priority                   = 130
    protocol                   = "Tcp"
    source_address_prefixes    = ["165.225.196.0/23", "147.161.170.0/23", "165.225.240.0/23", "147.161.166.0/23", "165.225.90.0/23", "165.225.20.0/23", "185.46.212.0/23", "165.225.84.0/23", "213.52.102.0/24", "165.225.204.0/23", "94.188.248.64/26", "165.225.194.0/23", "147.161.168.0/23", "165.225.80.0/22", "197.156.241.224/27", "165.225.26.0/23", "147.161.160.0/23", "197.98.201.0/24", "165.225.192.0/23", "196.23.154.64/27", "165.225.64.0/24", "165.225.88.0/23", "165.225.202.0/23", "165.225.94.0/23", "147.161.162.0/23", "165.225.92.0/23", "165.225.76.0/23", "185.46.214.0/23", "154.113.23.0/24", "165.225.66.0/24", "165.225.200.0/23", "147.161.164.0/23", "165.225.206.0/23", "165.225.12.0/23", "165.225.86.0/23", "165.225.198.0/23", "165.225.72.0/22"]
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    direction                  = "Inbound"
    name                       = "AllowLoadBalancerProb"
    priority                   = 190
    protocol                   = "*"
    source_address_prefix      = "AzureLoadBalancer"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_Pulse_Secure_VPN"
    priority                   = 140
    protocol                   = "Tcp"
    source_address_prefixes    = ["194.246.0.0/19", "62.252.197.0/24", "217.169.51.0/24", "204.17.245.4"]
    source_port_range          = "*"
  }
  depends_on = [ module.eu_gl_rg ]
}

resource "azurerm_subnet_network_security_group_association" "nsg_apim_association" {
  subnet_id                 = data.azurerm_subnet.subnet_apim.id
  network_security_group_id = azurerm_network_security_group.nsg_apim.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_appgw_association" {
  subnet_id                 = data.azurerm_subnet.subnet_appgw.id
  network_security_group_id = azurerm_network_security_group.nsg_apim_gw.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_aks_association" {
  subnet_id                 = data.azurerm_subnet.subnet_aks.id
  network_security_group_id = azurerm_network_security_group.nsg_apim_gw.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_pv_endpoint_association" {
  subnet_id                 = data.azurerm_subnet.subnet_pv_endpoints.id
  network_security_group_id = azurerm_network_security_group.nsg_apim_gw.id
}