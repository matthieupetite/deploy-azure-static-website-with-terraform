locals {
  mime_type = jsondecode(file("${path.module}/files/mime.json"))
}

# cf . https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
#tfsec:ignore:azure-storage-default-action-deny
#tfsec:ignore:azure-storage-use-secure-tls-policy
resource "azurerm_storage_account" "webapp" {
  name                     = azurecaf_name.webapp_storage.result
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }
}

data "azurerm_storage_container" "webappcontainer" {
  depends_on           = [azurerm_storage_account.webapp]
  name                 = "$web"
  storage_account_name = azurerm_storage_account.webapp.name
}

resource "azurerm_storage_blob" "website" {
  depends_on             = [data.azurerm_storage_container.webappcontainer]
  for_each               = fileset(path.module, "dist/**")
  name                   = replace(each.key, "dist/", "")
  storage_container_name = data.azurerm_storage_container.webappcontainer.name
  content_type           = lookup(local.mime_type, regex("\\.[^.]+$", each.key), null)
  storage_account_name   = azurerm_storage_account.webapp.name
  type                   = "Block"
  source                 = "//workspaces/deploy-azure-static-website-with-terraform/infra/${each.key}"
}
