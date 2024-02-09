module "password_reset" {
  source              = "../../modules/aviatrix_credential_rotation"
  controller_dns_name = var.script_input_data.aviatrix_controller_hostname
  account_reset = {
    name     = "" # Provide the Name of the Account
    password = "" # Provide the current password
    email    = "" # Provide the email address for that account
  }
}

module "gitlab_credential_update" {
  source                  = "../../modules/gitlab_credential_update"
  gitlab_url              = "" # The URL to the gitlab instance
  gitlab_bot_access_token = "" # Access Token for a Gitlab Bot to make changes to the gitlab project
  account_reset = {
    gitlab_variable_name = "" # Provide the Name of the Gitlab Environment Variable to change
    gitlab_env_value     = "" # Provide the Environment Scope if applicable
    gitlab_group_id      = "" # Provide the gitlab project group ID
    new_password         = module.password_reset.new_password
  }
}
