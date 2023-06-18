resource "kind_cluster" "default" {
  name           = var.name_kind
  wait_for_ready = true
  node_image     = "kindest/node:v1.24.13"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"


      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]

      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }

    node {
      role = "worker"
    }

    node {
      role = "worker"
    }

    node {
      role = "worker"
    }
  }
}


module "metrcis" {
  source = "./modules/metrics"

  depends_on = [kind_cluster.default]
}

module "ingress_nginx" {
  source = "./modules/ingress-nginx"

  depends_on = [kind_cluster.default]
}

module "sealed_secrets" {
  source = "./modules/sealed-secrets"

  depends_on = [kind_cluster.default]
}