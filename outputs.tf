#____________________________________________________________
#
# Collect the moid of the IPMI over LAN Policy as an Output
#____________________________________________________________

output "moid" {
  description = "IPMI over LAN Policy Managed Object ID (moid)."
  value       = intersight_ipmioverlan_policy.ipmi_over_lan.moid
}

output "key" {
  value     = var.ipmi_key_1
  sensitive = true
}