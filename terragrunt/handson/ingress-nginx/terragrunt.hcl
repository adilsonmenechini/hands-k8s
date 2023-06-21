

include {
  path = find_in_parent_folders()
}

locals {
  env_vars = yamldecode(file("./local.yaml"))
}

dependency "kind" {
  config_path = "../kind"
  mock_outputs = {
    cluster_name = "fake-test"
    host     = "fake-host"
    client_certificate = "fake-client_certificate"
    client_key = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
  skip_outputs = true
}

inputs = {
  chart_version = local.env_vars.chart_version
  name_kind = "kind-${dependency.kind.outputs.cluster_name}"
  host = dependency.kind.outputs.host
  client_certificate = dependency.kind.outputs.client_certificate
  client_key = dependency.kind.outputs.client_key
  cluster_ca_certificate = dependency.kind.outputs.cluster_ca_certificate
}

terraform {
  source = "../../../modules/02-ingress-nginx//."
  
}