module "azurerm_resourcegroup_version3" {
  source               = "github.com/rmsmatos/terraform_azurerm_resourcegroup_version3"
  name                 = "just-a-test"
  environmentShortname = "dev"
  location             = "westeurope"
  tags = {
    environment = "production"
    costcentre  = "cost center"
  }
}
