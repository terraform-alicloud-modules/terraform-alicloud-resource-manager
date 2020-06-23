output "this_role_ids" {
  description = "A list of resource manager role ids."
  value       = module.create_role_example.this_role_ids
}

output "this_role_arns" {
  description = "A list of role resource descriptors."
  value       = module.create_role_example.this_role_arns
}