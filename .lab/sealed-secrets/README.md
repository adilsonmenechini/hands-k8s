# Sealed Secrets

## Fetch public certificate

kubeseal --fetch-cert > .lab/sealed-secrets/pub.crt

## Fetch private certificate

kubectl get secret -n kube-system -l sealedsecrets.bitnami.com/sealed-secrets-key -o yaml >.lab/sealed-secrets/main.key kubectl get secret -n kube-system sealed-secrets-key -o yaml >>.lab/sealed-secrets/main.key

## Create a secret

### Create a yaml/yaml-encoded Secret somehow:
### (note use of `--dry-run` - this is just a locals file!)
echo -n gitops-argocd | kubectl create secret generic mysecret --dry-run=client --from-file=name=/dev/stdin -o yaml >mysecret.yaml

### or
cat .env | kubectl create secret generic mysecret2 --dry-run=client --from-literal=git_repo="https://github.com/adilsonmenechini/argocd" --from-file=git_token=/dev/stdin -o yaml > mysecret2.yaml | kubectl annotate -f mysecret2.yaml --locals sealedsecrets.bitnami.com/namespace-wide="true" --dry-run=client -o yaml > mysecret2.yaml

### This is the important bit:
kubeseal <mysecret.yaml --format=yaml >mysealedsecret.yaml

### At this point mysealedsecret.yaml is safe to upload to Github,
### post on Twitter, etc.

### Eventually:
kubectl create -f mysealedsecret.yaml

### Profit!
kubectl get secret mysecret -o yaml