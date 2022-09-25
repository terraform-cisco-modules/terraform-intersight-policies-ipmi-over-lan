<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Policies - IPMI over LAN
Manages Intersight IPMI over LAN Policies

Location in GUI:
`Policies` » `Create Policy` » `IPMI over LAN`

## Example

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}
```

### main.tf
```hcl
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
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

### Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

### Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```
<!-- END_TF_DOCS -->