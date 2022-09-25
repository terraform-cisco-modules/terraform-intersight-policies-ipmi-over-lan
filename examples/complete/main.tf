module "ipmi_over_lan" {
  source  = "terraform-cisco-modules/policies-ipmi-over-lan/intersight"
  version = ">= 1.0.1"

  description = "default IPMI over LAN Policy."
  enabled     = true
  # ipmi_key    = ""
  name         = "default"
  organization = "default"
  privilege    = "admin"
}
