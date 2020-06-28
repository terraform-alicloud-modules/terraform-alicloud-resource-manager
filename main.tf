provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/resource-manager"
}

#################
# Resource Group
#################
resource "alicloud_resource_manager_resource_group" "this" {
  count        = var.create_resource_group ? length(var.resource_groups) : 0
  name         = lookup(var.resource_groups[count.index], "name")
  display_name = lookup(var.resource_groups[count.index], "display_name")
}

#################
# Policy
#################
resource "alicloud_resource_manager_policy" "this" {
  count           = var.create_policy ? length(var.custom_policies) : 0
  policy_name     = lookup(var.custom_policies[count.index], "policy_name")
  description     = lookup(var.custom_policies[count.index], "description", "")
  policy_document = lookup(var.custom_policies[count.index], "policy_document")
}

#################
# Role
#################
resource "alicloud_resource_manager_role" "this" {
  count                       = var.create_role ? length(var.roles) : 0
  role_name                   = lookup(var.roles[count.index], "role_name")
  assume_role_policy_document = lookup(var.roles[count.index], "assume_role_policy_document")
  description                 = lookup(var.roles[count.index], "description")
  max_session_duration        = lookup(var.roles[count.index], "max_session_duration", "3600")
}

####################
# Resource Directory
####################
resource "alicloud_resource_manager_resource_directory" "this" {
  count = var.parent_folder_id != "" ? 0 : var.create_resource_directory ? 1 : 0
}

#################
# Folder
#################
resource "alicloud_resource_manager_folder" "this" {
  count            = var.create_folder ? length(var.folder_names) : 0
  parent_folder_id = var.parent_folder_id != "" ? var.parent_folder_id : alicloud_resource_manager_resource_directory.this[0].root_folder_id
  folder_name      = element(var.folder_names, count.index)
}

#################
# Account
#################
resource "alicloud_resource_manager_account" "this" {
  count        = var.create_account ? length(var.account_display_names) : 0
  folder_id    = var.folder_id
  display_name = element(var.account_display_names, count.index)
}

#################
# Handshake
#################
resource "alicloud_resource_manager_handshake" "this" {
  count         = var.create_handshake ? length(var.handshakes) : 0
  target_entity = lookup(var.handshakes[count.index], "target_entity")
  target_type   = lookup(var.handshakes[count.index], "target_type")
  note          = lookup(var.handshakes[count.index], "note", "")
  depends_on    = [alicloud_resource_manager_resource_directory.this]
}
