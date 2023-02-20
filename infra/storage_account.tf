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

resource "azurerm_storage_blob" "websitejsfiles" {
  depends_on             = [data.azurerm_storage_container.webappcontainer]
  for_each               = fileset(path.module, "dist/*.js")
  name                   = replace(each.key, "dist/", "")
  storage_account_name   = azurerm_storage_account.webapp.name
  storage_container_name = data.azurerm_storage_container.webappcontainer.name
  content_type           = "application/javascript"
  type                   = "Block"
  source                 = "/workspaces/sample-angular-app/infra/${each.key}"
}

resource "azurerm_storage_blob" "websitehtmlfiles" {
  depends_on             = [data.azurerm_storage_container.webappcontainer]
  for_each               = fileset(path.module, "dist/*.html")
  name                   = replace(each.key, "dist/", "")
  storage_account_name   = azurerm_storage_account.webapp.name
  storage_container_name = data.azurerm_storage_container.webappcontainer.name
  content_type           = "text/html"
  type                   = "Block"
  source                 = "/workspaces/sample-angular-app/infra/${each.key}"
}

resource "azurerm_storage_blob" "websitetxtfiles" {
  depends_on             = [data.azurerm_storage_container.webappcontainer]
  for_each               = fileset(path.module, "dist/*.txt")
  name                   = replace(each.key, "dist/", "")
  storage_account_name   = azurerm_storage_account.webapp.name
  storage_container_name = data.azurerm_storage_container.webappcontainer.name
  content_type           = "text/plain"
  type                   = "Block"
  source                 = "/workspaces/sample-angular-app/infra/${each.key}"
}

resource "azurerm_storage_blob" "websiteicofiles" {
  depends_on             = [data.azurerm_storage_container.webappcontainer]
  for_each               = fileset(path.module, "dist/*.ico")
  name                   = replace(each.key, "dist/", "")
  storage_account_name   = azurerm_storage_account.webapp.name
  storage_container_name = data.azurerm_storage_container.webappcontainer.name
  content_type           = "image/vnd.microsoft.icon"
  type                   = "Block"
  source                 = "/workspaces/sample-angular-app/infra/${each.key}"
}

resource "azurerm_storage_blob" "websitecssfiles" {
  depends_on             = [data.azurerm_storage_container.webappcontainer]
  for_each               = fileset(path.module, "dist/*.css")
  name                   = replace(each.key, "dist/", "")
  storage_account_name   = azurerm_storage_account.webapp.name
  storage_container_name = data.azurerm_storage_container.webappcontainer.name
  content_type           = "text/css"
  type                   = "Block"
  source                 = "/workspaces/sample-angular-app/infra/${each.key}"
}