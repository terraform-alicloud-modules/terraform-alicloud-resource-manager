#################
# Provider
#################
variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}

variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

################
# Resource Group
################
variable "resource_groups" {
  description = "A list mapping used to add multiple resource groups. Each item supports keys: 'name' and 'display_name'. Note that the name attribute value in the list must be unique."
  type        = list(map(string))
  default     = []
}

variable "create_resource_group" {
  description = "Whether to create resource group. If false, there will not create it. Default value is 'false'."
  type        = bool
  default     = false
}

###############
# Policy
###############
variable "create_policy" {
  description = "Whether to create policy. If false, there will not create it. Default value is 'false'."
  type        = bool
  default     = false
}

variable "custom_policies" {
  description = "A list mapping used to add multiple policies. Each item supports keys: 'policy_name', 'policy_document' and 'description'(default to null)."
  type        = list(map(string))
  default     = []
}

##################
# Role
##################
variable "create_role" {
  description = "Whether to create role. If false, there will not create it. Default value is 'false'."
  type        = bool
  default     = false
}

variable "roles" {
  description = "A list mapping used to add multiple roles. Each item supports keys:'role_name', 'assume_role_policy_document', 'description'(default to null) and 'max_session_duration'(default to 3600)."
  type        = list(map(string))
  default     = []
}

#####################
# Resource Directory
#####################
variable "create_resource_directory" {
  description = "Whether to create resource directory. If false, there will not create it. Default value is 'false'."
  type        = bool
  default     = false
}

#####################
# Folder
#####################
variable "create_folder" {
  description = "Whether to create folder. If false, there will not create it. Default value is 'false'."
  type        = bool
  default     = false
}

variable "parent_folder_id" {
  description = "The ID of the parent folder. If not set, the system default value will be used."
  type        = string
  default     = ""
}

variable "folder_names" {
  description = "A list of folder names."
  type        = list(string)
  default     = []
}

#####################
# Account
#####################
variable "create_account" {
  description = "Whether to create account. If false, there will not create it. Default value is 'false'."
  type        = bool
  default     = false
}

variable "folder_id" {
  description = "The ID of the parent folder."
  type        = string
  default     = ""
}

variable "payer_account_id" {
  description = "Settlement account ID. If the value is empty, the current account will be used for settlement."
  type        = string
  default     = ""
}

variable "account_display_names" {
  description = "A list of account display names."
  type        = list(string)
  default     = []
}

#####################
# Handshake
#####################
variable "create_handshake" {
  description = "Whether to create handshake. If false, there will not create it. Default value is 'false'."
  type        = bool
  default     = false
}

variable "handshakes" {
  description = "A list mapping used to add multiple handshakes. Each item supports keys:'target_entity', 'target_type' and 'note'(default to null)."
  type        = list(map(string))
  default     = []
}
