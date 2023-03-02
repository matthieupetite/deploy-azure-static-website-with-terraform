output "static_website_endpoint" {
  value       = azurerm_storage_account.webapp.primary_web_endpoint
  sensitive   = false
  description = "Static website endpoint"
}
