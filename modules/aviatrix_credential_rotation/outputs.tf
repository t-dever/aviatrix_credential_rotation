output "new_password" {
  value     = random_password.password[each.key].result
  sensitive = true
}