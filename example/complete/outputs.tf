################
# Resource Group
################
output "this_resource_group_ids" {
  description = "A list of resource group ids."
  value       = module.resource_group_complete_example.this_resource_group_ids
}

output "this_resource_group_statues" {
  description = "A list of resource group statues."
  value       = module.resource_group_complete_example.this_resource_group_statues
}

################
# Policy
################
output "this_policy_ids" {
  description = "A list of policy ids"
  value       = module.resource_group_complete_example.this_policy_ids
}

################
# Role
################
output "this_role_ids" {
  description = "A list of resource manager role ids."
  value       = module.resource_group_complete_example.this_role_ids
}

output "this_role_arns" {
  description = "A list of role resource descriptors."
  value       = module.resource_group_complete_example.this_role_arns
}

####################
# Resource Directory
####################
output "this_resource_directory_ids" {
  description = "A list of the resource directory ids."
  value       = module.resource_group_complete_example.this_resource_directory_ids
}

output "this_root_folder_ids" {
  description = "A list of root folder ids."
  value       = module.resource_group_complete_example.this_root_folder_ids
}

output "this_master_account_ids" {
  description = "A list of master account ids."
  value       = module.resource_group_complete_example.this_master_account_names
}

output "this_master_account_names" {
  description = "A list of master account names."
  value       = module.resource_group_complete_example.this_master_account_names
}

################
# Folder
################
output "this_folder_ids" {
  description = "The ID of the folder."
  value       = module.resource_group_complete_example.this_folder_ids
}

################
# Account
################
output "this_account_ids" {
  description = "A list of resource manager account ids."
  value       = module.resource_group_complete_example.this_account_ids
}

output "this_account_statues" {
  description = "A list of member joining statues."
  value       = module.resource_group_complete_example.this_account_statues
}

################
# Handshake
################
output "this_handshake_ids" {
  description = "A list of resource manager handshake ids."
  value       = module.resource_group_complete_example.this_handshake_ids
}

output "this_handshake_statues" {
  description = "A list of invitation statues."
  value       = module.resource_group_complete_example.this_handshake_statues
}