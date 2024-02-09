terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "16.2.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "gitlab" {
  base_url = var.gitlab_url
}