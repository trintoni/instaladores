helm repo add hashicorp https://helm.releases.hashicorp.com
kubectl create namespace consul 
helm install consul hashicorp/consul --set global.name=hashicorp --create-namespace --namespace consul --values values.yaml
sleep 200
# Habilitando acesso remoto com port foward
# kubectl port-forward svc/consul-server --namespace hashicorp 8500:8500 --address='0.0.0.0' &

# SITE
# https://developer.hashicorp.com/consul/tutorials/kubernetes/kubernetes-minikube?utm_source=docs
