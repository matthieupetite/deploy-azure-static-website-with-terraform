# cf . https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name
resource "azurecaf_name" "rg-application" {
  name          = "website-sample"
  resource_type = "azurerm_resource_group"
  suffixes      = [var.environment, var.location_abbreviation]
  clean_input   = true
}

resource "azurecaf_name" "webapp_storage" {
  name          = "staticwebsite"
  resource_type = "azurerm_storage_account"
  suffixes      = [var.environment, var.location_abbreviation]
}