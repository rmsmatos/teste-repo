variable "name" {
  type        = string
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 82 && can(regex("^[a-zA-Z0-9-._\\(\\)]+[a-zA-Z0-9-_\\(\\)]$", var.name))
    error_message = "Invalid name (check Azure Resource naming restrictions for more info)."
  }
}

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  default     = null
}

variable "managed_by" {
  type        = string
  description = "(Optional) The ID of the resource or application that manages this Resource Group."
  default     = null
}

variable "environmentShortname" {
  type        = string
  description = "(Optional) If set, this string will  be appended to Resource Group Name."
  default     = null
}
