terraform {
  source = "../../../modules/00-kind-cluster/"
}

include {
  path = find_in_parent_folders()
}

# locals {
#   env_vars = yamldecode(file(find_in_parent_folders("environment.yaml")))
# }

inputs = {
  name_kind = local.global_vars.name_kind
  cluster_version = "v1.24.13"
}

