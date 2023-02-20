# cf . https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name
resource "azurecaf_name" "rg-application" {
  name          = "mkp-websites-sample"
  resource_type = "azurerm_resource_group"
  suffixes      = [var.environment, var.location_abbreviation]
  clean_input   = true
}

resource "azurecaf_name" "static_site_identity" {
  name          = "static-site-identity"
  resource_type = "azurerm_user_assigned_identity"
  suffixes      = [var.environment, var.location_abbreviation]
  clean_input   = true
}

resource "azurecaf_name" "static_site" {
  name          = "staticsite"
  resource_type = "general"
  prefixes      = ["webstatic"]
  suffixes      = [var.environment, var.location_abbreviation]
}

resource "azurecaf_name" "webapp_storage" {
  name          = "webapp"
  resource_type = "azurerm_storage_account"
  suffixes      = [var.environment, var.location_abbreviation]
}