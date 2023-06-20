locals {
  folders     = split("/", path_relative_to_include())
  global_vars = yamldecode(file("global.yaml"))
  common_tags = merge(local.global_vars)
}