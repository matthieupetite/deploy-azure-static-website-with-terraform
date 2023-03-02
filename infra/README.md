# April Marketplace Azure Deployement

This project is dedicated to evaluate the deployement of an Angular application on Azure by
using the azure static web site service

Start implementing your terraform code here 😎

## Requirements

| Name                                                                  | Version  |
| --------------------------------------------------------------------- | -------- |
| <a name="requirement_azapi"></a> [azapi](#requirement_azapi)          | ~>1.0.0  |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement_azurecaf) | =1.2.1   |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm)    | ~>3.39.1 |
| <a name="requirement_random"></a> [random](#requirement_random)       | 3.4.3    |

## Providers

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="provider_azurecaf"></a> [azurecaf](#provider_azurecaf) | 1.2.1   |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm)    | 3.39.1  |

## Modules

No modules.

## Resources

| Name                                                                                                                                              | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurecaf_name.rg-application](https://registry.terraform.io/providers/aztfmod/azurecaf/1.2.1/docs/resources/name)                                | resource    |
| [azurecaf_name.static_site](https://registry.terraform.io/providers/aztfmod/azurecaf/1.2.1/docs/resources/name)                                   | resource    |
| [azurecaf_name.static_site_identity](https://registry.terraform.io/providers/aztfmod/azurecaf/1.2.1/docs/resources/name)                          | resource    |
| [azurecaf_name.webapp_storage](https://registry.terraform.io/providers/aztfmod/azurecaf/1.2.1/docs/resources/name)                                | resource    |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)                     | resource    |
| [azurerm_storage_account.webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)                 | resource    |
| [azurerm_storage_blob.websitecssfiles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob)              | resource    |
| [azurerm_storage_blob.websitehtmlfiles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob)             | resource    |
| [azurerm_storage_blob.websiteicofiles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob)              | resource    |
| [azurerm_storage_blob.websitejsfiles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob)               | resource    |
| [azurerm_storage_blob.websitetxtfiles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob)              | resource    |
| [azurerm_storage_container.webappcontainer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_container) | data source |

## Inputs

| Name                                                                                             | Description                            | Type     | Default          | Required |
| ------------------------------------------------------------------------------------------------ | -------------------------------------- | -------- | ---------------- | :------: |
| <a name="input_environment"></a> [environment](#input_environment)                               | environment name                       | `string` | `"sandbox"`      |    no    |
| <a name="input_location"></a> [location](#input_location)                                        | Location of the resources              | `string` | `"North Europe"` |    no    |
| <a name="input_location_abbreviation"></a> [location_abbreviation](#input_location_abbreviation) | Location abbreviation of the resources | `string` | `"northeu"`      |    no    |

## Outputs

No outputs.
