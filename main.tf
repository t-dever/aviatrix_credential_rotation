module "password_reset" {
  source              = "modules/aviatrix_credential_rotation"
  controller_dns_name = var.script_input_data.aviatrix_controller_hostname
  account_reset       = {
    name     = ""  # Provide the Name of the Account
    password = ""  # Provide the current password
    email    = ""  # Provide the email address for that account
  }
}