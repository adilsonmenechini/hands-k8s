terraform {
  source = "../../../modules/00-kind-cluster//."
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name_kind = "test"
  cluster_version = "v1.24.13"
}