terraform {
  required_providers {
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "~>3.0.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    time = {
      source = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "aviatrix" {}

provider "random" {}

provider "null" {}
