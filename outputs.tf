output "public_ip" {
  value = local.public_ip
}

output "details_endpoint" {
  value = local.static_endpoint
}

output "details_content" {
  value = module.registration.details_content
}

output "registration_json" {
  value = module.registration.registration_json
}

output "network_name" {
  value = var.network_name
}

output "registration_command" {
  value = module.registration.registration_command
}

output "update_registration_command" {
  value = module.registration.update_registration_command
}