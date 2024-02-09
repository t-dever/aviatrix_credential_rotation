variable "account_reset" {
  description = "Information for the account that will have a password reset."
  type = map(object({
    gitlab_variable_name = string,
    gitlab_env_value     = string,
    gitlab_group_id      = string,
    new_password         = string
  }))
  sensitive = true
}

variable "gitlab_url" {
  description = "The URL for the gitlab instance."
  type        = string
}

variable "gitlab_bot_access_token" {
  description = "The access token used for the gitlab bot."
  type        = string
  sensitive   = true
}
