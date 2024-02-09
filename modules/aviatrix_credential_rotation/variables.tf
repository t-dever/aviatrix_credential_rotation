variable "controller_dns_name" {
  description = "The controller DNS Name."
  type        = string
  sensitive   = true
}

variable "account_reset" {
  description = "Information for the account that will have a password reset."
  type = map(object({
    name                 = string,
    password             = string,
    email                = string,
  }))
  sensitive = true
}
