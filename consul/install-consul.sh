helm repo add hashicorp https://helm.releases.hashicorp.com
kubectl create namespace consul
helm install consul hashicorp/consul --set global.name=consul --create-namespace --namespace consul
sleep 200
# Habilitando acesso remoto com port foward
kubectl port-forward svc/consul-ui --namespace consul 8501:443 --address='0.0.0.0' &

# SITE
# https://developer.hashicorp.com/consul/tutorials/kubernetes/kubernetes-minikube?utm_source=docs
