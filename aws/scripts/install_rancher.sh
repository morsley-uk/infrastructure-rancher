#!/usr/bin/env bash

#    _____           _        _ _   _____                  _               
#   |_   _|         | |      | | | |  __ \                | |              
#     | |  _ __  ___| |_ __ _| | | | |__) |__ _ _ __   ___| |__   ___ _ __ 
#     | | | '_ \/ __| __/ _` | | | |  _  // _` | '_ \ / __| '_ \ / _ \ '__|
#    _| |_| | | \__ \ || (_| | | | | | \ \ (_| | | | | (__| | | |  __/ |   
#   |_____|_| |_|___/\__\__,_|_|_| |_|  \_\__,_|_| |_|\___|_| |_|\___|_|   
#
                                                                                
# Install Rancher via Helm
        
echo '###############################################################################'
echo '# Installing Rancher...'
echo '###############################################################################'

set -x
                                               
export KUBECONFIG=$(pwd)/rancher/kube_config.yaml
#chmod 400 $(pwd)/rancher/node.pem

# https://rancher.com/docs/rancher/v2.x/en/installation/k8s-install/helm-rancher/

# Cert-Manager...

kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml

kubectl create namespace cert-manager

helm repo add jetstack https://charts.jetstack.io

#helm repo update

helm install cert-manager jetstack/cert-manager \
  --version v0.12.0 \
  --namespace cert-manager \
  --wait

kubectl get all --namespace cert-manager
  
# Rancher...

helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

#helm repo update

kubectl create namespace cattle-system

#helm install rancher rancher-stable/rancher \
#  --namespace cattle-system \
#  --version v2.3.5 \
#  --set hostname=rancher.morsley.io \
#  --set ingress.tls.source=letsEncrypt \
#  --set letsEncrypt.email=letsencrypt@morsley.uk \
#  --wait

#helm install rancher rancher-stable/rancher \
#  --namespace cattle-system \
#  --version v2.4.0 \
#  --set hostname=rancher.morsley.io \
#  --set ingress.tls.source=letsEncrypt \
#  --set letsEncrypt.email=letsencrypt@morsley.uk \
#  --set letsEncrypt.environment=staging

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.morsley.io

kubectl get all --namespace cattle-system

# https://whynopadlock.com
# https://www.ssllabs.com/ssltest/

# https://rancher.com/docs/rancher/v2.x/en/installation/options/troubleshooting/

set +x

echo '###############################################################################'
echo '# Rancher Installed'
echo '###############################################################################'

exit 0