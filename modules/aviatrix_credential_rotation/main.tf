# Get Aviatrix CID
data "aviatrix_caller_identity" "cid" {}

# Create a resource that has a different timestamp each run.
resource "time_static" "time" {
  triggers = {
    always_run = timestamp()
  }
}

# Generate new password
resource "random_password" "password" {
  for_each = nonsensitive(var.account_reset)
  lifecycle {
    replace_triggered_by = [time_static.time] # Forces deletion before being created
  }
  length           = 32
  special          = true
  lower            = true
  numeric          = true
  upper            = true
  min_lower        = 8
  min_numeric      = 8
  min_special      = 8
  min_upper        = 8
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "null_resource" "rotate_credential" {
  for_each = nonsensitive(var.account_reset)
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "python3 ${path.module}/aviatrix_credential_rotation.py"
    environment = {
      AVIATRIX_CONTROLLER_DNS_NAME = var.controller_dns_name
      CID                          = data.aviatrix_caller_identity.cid.cid
      AVIATRIX_ACCOUNT_NAME        = each.value.name
      AVIATRIX_OLD_PASSWORD        = each.value.password
      AVIATRIX_NEW_PASSWORD        = random_password.password[each.key].result
      AVIATRIX_EMAIL               = each.value.email
    }
  }
}
