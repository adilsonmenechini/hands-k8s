resource "helm_release" "ingress_nginx" {
  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.7.0"

  namespace  = "ingress-nginx"
  create_namespace = true

  wait         = true
  force_update = true
  timeout          = 120

  values = [file("${path.module}/values/ingress.yaml")]
}


resource "null_resource" "wait_for_ingress_nginx" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the nginx ingress controller...\n"
      kubectl wait --namespace ${helm_release.ingress_nginx.namespace} \
        --for=condition=ready pod \
        --selector=app.kubernetes.io/component=controller \
        --timeout=90s
    EOF
  }

  depends_on = [helm_release.ingress_nginx]
}