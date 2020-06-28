################
# Folder
################
output "this_folder_ids" {
  description = "A list of resource manager folder ids."
  value       = module.create_resource_example.this_folder_ids
}

################
# Account
################
output "this_account_ids" {
  description = "A list of resource manager account ids."
  value       = module.create_resource_example.this_account_ids
}

output "this_account_statues" {
  description = "A list of member joining statues."
  value       = module.create_resource_example.this_account_statues
}

################
# Handshake
################
output "this_handshake_ids" {
  description = "A list of resource manager handshake ids."
  value       = module.create_resource_example.this_handshake_ids
}

output "this_handshake_statues" {
  description = "A list of invitation statues."
  value       = module.create_resource_example.this_handshake_statues
}