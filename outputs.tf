################
# Resource Group
################
output "this_resource_group_ids" {
  description = "A list of resource group ids."
  value       = alicloud_resource_manager_resource_group.this.*.id
}

output "this_resource_group_statues" {
  description = "A list of resource group statues."
  value       = alicloud_resource_manager_resource_group.this.*.status
}

################
# Policy
################
output "this_policy_ids" {
  description = "A list of policy ids"
  value       = alicloud_resource_manager_policy.this.*.id
}

################
# Role
################
output "this_role_ids" {
  description = "A list of resource manager role ids."
  value       = alicloud_resource_manager_role.this.*.id
}

output "this_role_arns" {
  description = "A list of role resource descriptors."
  value       = alicloud_resource_manager_role.this.*.arn
}

####################
# Resource Directory
####################
output "this_resource_directory_ids" {
  description = "A list of the resource directory ids. "
  value       = alicloud_resource_manager_resource_group.this.*.id
}

output "this_root_folder_ids" {
  description = "A list of root folder ids."
  value       = alicloud_resource_manager_resource_directory.this.*.root_folder_id
}

output "this_master_account_ids" {
  description = "A list of master account ids."
  value       = alicloud_resource_manager_resource_directory.this.*.master_account_id
}

output "this_master_account_names" {
  description = "A list of master account names."
  value       = alicloud_resource_manager_resource_directory.this.*.master_account_name
}

################
# Folder
################
output "this_folder_ids" {
  description = "A list of resource manager folder ids."
  value       = alicloud_resource_manager_folder.this.*.id
}

################
# Account
################
output "this_account_ids" {
  description = "A list of resource manager account ids."
  value       = alicloud_resource_manager_account.this.*.id
}

output "this_account_statues" {
  description = "A list of member joining statues."
  value       = alicloud_resource_manager_account.this.*.status
}

################
# Handshake
################
output "this_handshake_ids" {
  description = "A list of resource manager handshake ids."
  value       = alicloud_resource_manager_handshake.this.*.id
}

output "this_handshake_statues" {
  description = "A list of invitation statues."
  value       = alicloud_resource_manager_handshake.this.*.status
}
