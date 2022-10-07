#____________________________________________________________
#
# IPMI over LAN Policy Variables Section.
#____________________________________________________________

variable "description" {
  default     = ""
  description = "Description for the Policy."
  type        = string
}

variable "enabled" {
  default     = true
  description = "Flag to Enable or Disable the Policy."
  type        = bool
}

variable "ipmi_key" {
  default     = null
  description = "If null then encryption will not be applied.  If the value is set to 1 it will apply the ipmi_key_1 value."
  type        = number
}

variable "ipmi_key_1" {
  default     = ""
  description = "Encryption key 1 to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
  sensitive   = true
  type        = string
}

variable "privilege" {
  default     = "admin"
  description = <<-EOT
    The highest privilege level that can be assigned to an IPMI session on a server.
    * admin - Privilege to perform all actions available through IPMI.
    * user - Privilege to perform some functions through IPMI but restriction on performing administrative tasks.
    * read-only - Privilege to view information throught IPMI but restriction on making any changes.
  EOT
  type        = string
}

variable "name" {
  default     = "ipmi"
  description = "Name for the Policy."
  type        = string
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "profiles" {
  default     = []
  description = <<-EOT
    List of Profiles to Assign to the Policy.
    * name - Name of the Profile to Assign.
    * object_type - Object Type to Assign in the Profile Configuration.
      - server.Profile - For UCS Server Profiles.
      - server.ProfileTemplate - For UCS Server Profile Templates.
  EOT
  type = list(object(
    {
      name        = string
      object_type = optional(string, "server.Profile")
    }
  ))
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}
