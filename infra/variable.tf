variable "location" {
  type        = string
  description = "Location of the resources"
  default     = "North Europe"
}

variable "location_abbreviation" {
  type        = string
  description = "Location abbreviation of the resources"
  default     = "northeu"
}

variable "environment" {
  type        = string
  description = "environment name"
  default     = "sandbox"
}