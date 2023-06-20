resource "helm_release" "sealed_secrets" {
  name = "sealed-secrets-controller"

  repository = "https://bitnami-labs.github.io/sealed-secrets"
  chart      = "sealed-secrets"
  namespace  = "kube-system"
  version    = var.chart_version

  wait = true

}