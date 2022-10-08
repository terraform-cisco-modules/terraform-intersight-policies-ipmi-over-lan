terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "ipmi_key_1" {
  sensitive = true
  type      = string
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

output "key" {
  value     = module.main.key
  sensitive = true
}

# This is the module under test
module "main" {
  source       = "../.."
  description  = "${var.name} IPMI over LAN Policy."
  enabled      = true
  ipmi_key     = 1
  ipmi_key_1   = var.ipmi_key_1
  name         = var.name
  organization = "terratest"
}
