# Create a resource that has a different timestamp each run.
resource "time_static" "gitlab_time" {
  triggers = {
    always_run = timestamp()
  }
}

# Create the gitlab environment variable. 
resource "gitlab_group_variable" "gitlab_variable" {
  lifecycle {
    replace_triggered_by = [time_static.gitlab_time] # Forces deletion before being created
  }
  for_each          = nonsensitive(var.account_reset)
  group             = each.value.gitlab_group_id
  key               = each.value.gitlab_variable_name
  value             = each.value.new_password
  protected         = false
  masked            = true
  raw               = true
  variable_type     = "env_var"
  environment_scope = each.value.gitlab_env_value
}
