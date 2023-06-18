provider "kind" {}

terraform {
  required_version = ">=1.1.5"

  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.1.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host = kind_cluster.default.endpoint

    client_certificate     = kind_cluster.default.client_certificate
    client_key             = kind_cluster.default.client_key
    cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
  }
}


provider "kubernetes" {
  host = kind_cluster.default.endpoint

  client_certificate     = kind_cluster.default.client_certificate
  client_key             = kind_cluster.default.client_key
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
}


