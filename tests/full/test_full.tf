variable "ipmi_key_1" {
  sensitive = true
  type      = string
}

module "main" {
  source       = "../.."
  description  = "${var.name} IPMI over LAN Policy."
  enabled      = true
  ipmi_key     = 1
  ipmi_key_1   = var.ipmi_key_1
  name         = var.name
  organization = "terratest"
}
