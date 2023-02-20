/**
 * # April Marketplace Azure Deployement
 *
 * This project is dedicated to evaluate the deployement of an Angular application on Azure by
 * using the azure static web site service
 *
 *
 * Start implementing your terraform code here 😎
 */


# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "this" {
  name     = azurecaf_name.rg-application.result
  location = var.location
  tags     = local.tags
}
