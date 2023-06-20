locals {
  folders     = split("/", path_relative_to_include())
  global_vars = yamldecode(file("global.yaml"))
  common_tags = merge(local.global_vars)
}


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
    required_providers = ${yamlencode(local.required_providers)}
  EOF
}