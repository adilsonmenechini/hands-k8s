resource "helm_release" "ingress_nginx" {
  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  namespace  = "ingress-nginx"
  create_namespace = true

  wait         = true
  force_update = true
  timeout          = 120

  values = [file("${path.module}/values/ingress.yaml")]
}