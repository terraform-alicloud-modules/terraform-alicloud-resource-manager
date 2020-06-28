output "this_resource_group_ids" {
  description = "A list of resource group ids."
  value       = module.create_resource_group_example.this_resource_group_ids
}

output "this_resource_statues" {
  description = "A list of resource group statues."
  value       = module.create_resource_group_example.this_account_statues
}