terraform {
  required_version = ">=1.1.5"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = var.k8s_context
  }
}


provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = var.k8s_context

}


