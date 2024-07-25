module "region" {
  source = "github.com/rmsmatos/terraform_azurerm_regions_version1"
  #checkov:skip=CKV_TF_1:We don't need to be paranoic for this module
  azure_region = var.location
}

resource "azurerm_resource_group" "resourcegroup" {
  name       = lower(var.environmentShortname != null ? lower("rg-${var.name}-${module.region.location_fixed4char}-${var.environmentShortname}") : lower("rg-${var.name}-${module.region.location_fixed4char}"))
  location   = module.region.location_cli
  managed_by = var.managed_by
  tags       = var.tags
}
