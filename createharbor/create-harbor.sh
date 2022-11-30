# Anderson Trintoni
# Link da web https://loft.sh/blog/harbor-kubernetes-self-hosted-container-registry/ 
# Instalacao do Harbor em Kubernetes - Minikube
# Testado no Ubuntu 20.04
# Necessário pacotes:
# kubectl - Que devera ser instalado antes desse script
# expect - Quer será instalado por esse script
sudo apt install expect -y
minikube start
minikube addons enable ingress
kubectl create namespace harbor
sleep 10
helm repo add harbor https://helm.goharbor.io -n harbor
helm install my-release harbor/harbor -n harbor
eval $(minikube docker-env)
kubectl -n harbor get secrets harbor-ingress -o jsonpath="{.data['ca\.crt']}" | base64 -d > harbor-ca.crt
scp -o IdentitiesOnly=yes -i $(minikube ssh-key) harbor-ca.crt docker@$(minikube ip):./harbor-ca.crt
expect script.exp
