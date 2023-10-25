resource "azurerm_network_security_group" "nsg_us_apim" {
  location            = var.eu_vars.resource_group.resource_group_location
  resource_group_name = var.eu_vars.resource_group.resource_group_name
  name                = "nsg-us-apim-gl-nonprod"
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
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "3443"
    direction                  = "Inbound"
    name                       = "Manegement_Endpoint"
    priority                   = 105
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "6381-6383"
    direction                  = "Outbound"
    name                       = "Dependency_on_Redis_Cache_outbound"
    priority                   = 160
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
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
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "6381-6383"
    direction                  = "Inbound"
    name                       = "Dependency_on_Redis_Cache"
    priority                   = 130
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
    access                     = "Deny"
    destination_address_prefix = "Internet"
    destination_port_range     = "*"
    direction                  = "Outbound"
    name                       = "Deny_All_Internet_Outbound"
    priority                   = 999
    protocol                   = "*"
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
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "80"
    direction                  = "Inbound"
    name                       = "Client_communication_to_API_Management"
    priority                   = 100
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
    destination_address_prefix = "Storage"
    destination_port_range     = "445"
    direction                  = "Outbound"
    name                       = "Dependency_on_Azure_File_Share_for_GIT"
    priority                   = 170
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    description                = "CCV2API Internal APIM Configuration"
    destination_address_prefix = "13.95.194.43"
    destination_port_ranges    = ["80", "443"]
    direction                  = "Outbound"
    name                       = "AllowCCv2Outbound"
    priority                   = 240
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "194.246.1.65"
    destination_port_ranges    = ["80", "443"]
    direction                  = "Outbound"
    name                       = "AllowWgateExternal"
    priority                   = 230
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }
}

resource "azurerm_network_security_group" "nsg_us_apim_mgmt" {
  location            = var.eu_vars.resource_group.resource_group_location
  resource_group_name = var.eu_vars.resource_group.resource_group_name
  name                = "nsg-us-mgmt-gl-nonprod"
  security_rule {
    access                     = "Allow"
    destination_address_prefix = "10.219.0.64/27"
    destination_port_range     = "22"
    direction                  = "Inbound"
    name                       = "AllowSSHExternal"
    priority                   = 1003
    protocol                   = "Tcp"
    source_address_prefix      = "62.252.197.228/32"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "10.219.0.68"
    destination_port_range     = "22"
    direction                  = "Inbound"
    name                       = "AllowSSH-Outbound"
    priority                   = 300
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                       = "Allow"
    destination_address_prefixes = ["194.246.0.241", "10.5.34.241", "192.168.137.9", "10.5.34.242"]
    destination_port_ranges      = ["17472", "17486", "17475"]
    direction                    = "Outbound"
    name                         = "DMZ_Zone_Server_Outbound"
    priority                     = 1010
    protocol                     = "Tcp"
    source_address_prefix        = "*"
    source_port_range            = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "10.219.0.68"
    destination_port_range     = "22"
    direction                  = "Inbound"
    name                       = "AllowSSH"
    priority                   = 201
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "10.219.0.64/27"
    destination_port_range     = "3389"
    direction                  = "Inbound"
    name                       = "AllowRDPExternal"
    priority                   = 1000
    protocol                   = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_ranges    = ["17472", "17486"]
    direction                  = "Inbound"
    name                       = "DMZ-Zone-Server-17472"
    priority                   = 310
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.137.9"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "10.219.0.64/27"
    destination_port_range     = "22"
    direction                  = "Inbound"
    name                       = "kibana_test"
    priority                   = 1004
    protocol                   = "Tcp"
    source_address_prefix      = "20.86.119.98"
    source_port_range          = "22"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_ranges    = ["17472", "17486"]
    direction                  = "Inbound"
    name                       = "DMZ-Zone-Server-17486"
    priority                   = 320
    protocol                   = "Tcp"
    source_address_prefix      = "194.246.0.241"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    direction                  = "Inbound"
    name                       = "AllowMyIpAddressCustomInbound"
    priority                   = 1002
    protocol                   = "*"
    source_address_prefix      = "147.161.188.191"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "27017"
    direction                  = "Outbound"
    name                       = "AllowMongoDBExternal"
    priority                   = 1001
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Deny"
    description                = "MDC JIT Network Access rule for policy 'default' of VM 'MyAccountVM'."
    destination_address_prefix = "10.219.0.68"
    destination_port_range     = "3389"
    direction                  = "Inbound"
    name                       = "MicrosoftDefenderForCloud-JITRule_-1151891693_545C5DBC675443D3BF179EFD1EF8254D"
    priority                   = 4096
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_ranges    = ["17472", "17475"]
    direction                  = "Inbound"
    name                       = "DMZ-Zone-Server"
    priority                   = 330
    protocol                   = "Tcp"
    source_address_prefixes    = ["10.5.34.241", "10.5.34.242"]
    source_port_range          = "*"
  }
}

resource "azurerm_network_security_group" "nsg_us_apim_gw" {
  location            = var.eu_vars.resource_group.resource_group_location
  resource_group_name = var.eu_vars.resource_group.resource_group_name
  name                = "nsg-us-gw-gl-nonprod"
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
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_AKAMAI_SiteShield_HTTPS"
    priority                   = 120
    protocol                   = "Tcp"
    source_address_prefixes    = ["92.122.54.0/24", "23.15.178.0/24", "23.47.56.0/24", "104.107.217.0/24", "96.7.74.0/24", "23.35.71.0/24", "104.102.248.0/24", "95.101.79.0/24", "23.56.236.0/24", "184.28.156.0/24", "95.100.169.0/24", "95.100.193.0/24", "2.22.242.0/24", "184.31.1.0/24", "23.202.229.0/24", "92.123.142.0/24", "23.5.164.0/24", "23.33.28.0/24", "95.101.143.0/24", "104.107.216.0/24", "23.220.96.0/24", "23.3.88.0/24", "23.218.248.0/24", "95.101.78.0/24", "2.22.61.0/24", "23.47.59.0/24", "23.15.177.0/24", "23.52.43.0/24", "88.221.135.0/24", "23.47.145.0/24", "23.36.160.0/24", "2.19.119.0/24", "23.195.73.0/24", "23.213.54.0/24", "23.48.94.0/24", "104.125.2.0/24", "2.17.112.0/24", "184.30.41.0/24", "23.36.1.0/24", "92.123.122.0/24", "88.221.217.0/24", "23.35.149.0/24", "184.26.137.0/24", "23.217.99.0/24", "92.123.71.0/24", "23.72.255.0/24", "168.143.242.0/24", "84.53.185.0/24", "2.16.101.0/24", "95.100.97.0/24", "23.198.13.0/24", "96.7.218.0/24", "80.67.72.0/24", "2.19.194.0/24", "23.64.120.0/24", "23.11.206.0/24", "184.25.204.0/24", "168.143.243.0/24"]
    source_port_range          = "*"
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
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "Allow_Pulse_Secure_VPN"
    priority                   = 140
    protocol                   = "Tcp"
    source_address_prefixes    = ["194.246.0.0/19", "62.252.197.0/24", "217.169.51.0/24", "204.17.245.4"]
    source_port_range          = "*"
  }
}
