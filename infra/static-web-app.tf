# # add a user assigned identity to the static site
# resource "azurerm_user_assigned_identity" "this" {
#   name                = azurecaf_name.static_site_identity.name
#   resource_group_name = azurerm_resource_group.this.name
#   location            = var.location
# }
# # cf . https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_site
# resource "azurerm_static_site" "this" {
#   name                = azurecaf_name.static_site.name
#   resource_group_name = azurerm_resource_group.this.name
#   location            = var.location
#   sku_tier = "Standard"
#   sku_size = "Standard"

#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.this.id]
#   }
# }

