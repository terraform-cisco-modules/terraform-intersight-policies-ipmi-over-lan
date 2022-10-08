output "moid" {
  value = module.main.moid
}

output "key" {
  value     = module.main.key
  sensitive = true
}
