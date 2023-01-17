#!/bin/bash
kubectl apply -f $PWD/k8s/namespace.yml
#kubectl apply -f $PWD/k8s/security.yml
source $PWD/.env
export JWT_PUBLIC_KEY=$(cat $PWD/key.public | tr -d '\n'  )
export JWT_PRIVATE_KEY=$(cat $PWD/key.public | tr -d '\n'  )
#envsubst < $PWD/k8s/config-env-filebeats.yml | kubectl apply -f -
#kubectl apply -f $PWD/k8s/filebeats.yml
envsubst < $PWD/k8s/config.map.user.yml | kubectl apply -f -
envsubst < $PWD/k8s/config.map.user.yml | cat 
envsubst < $PWD/k8s/config.map.credential.yml | kubectl apply -f -
envsubst < $PWD/k8s/config.db.user.yml | kubectl apply -f -
envsubst < $PWD/k8s/config.db.credential.yml | kubectl apply -f -
kubectl apply -f $PWD/k8s/config.keys.yml
kubectl apply -f $PWD/k8s/config.init.db.credential.yml
kubectl apply -f $PWD/k8s/config.init.db.user.yml
kubectl apply -f $PWD/k8s/pvc.user.yml
kubectl apply -f $PWD/k8s/pvc.credential.yml
envsubst < $PWD/k8s/deployment.bd.credential.yml | kubectl apply -f -
envsubst < $PWD/k8s/deployment.bd.user.yml | kubectl apply -f -
kubectl apply -f $PWD/k8s/service.bd.credential.yml
kubectl apply -f $PWD/k8s/service.bd.user.yml
kubectl apply -f $PWD/k8s/deployment.credential.grpc.yml
kubectl apply -f $PWD/k8s/deployment.credential.rest.yml
kubectl apply -f $PWD/k8s/deployment.user.grpc.yml
kubectl apply -f $PWD/k8s/deployment.user.rest.yml
kubectl apply -f $PWD/k8s/service.user.grpc.yml
kubectl apply -f $PWD/k8s/service.user.rest.yml
kubectl apply -f $PWD/k8s/service.credential.grpc.yml
kubectl apply -f $PWD/k8s/service.credential.rest.yml
#kubectl apply -f $PWD/k8s/hpa.yml
#kubectl apply -f $PWD/k8s/prometheus.yml
#kubectl apply -f $PWD/k8s/grafana.yml
#kubectl apply -f $PWD/k8s/nodeExporter.yml
#kubectl create -n appzone secret docker-registry \
#   --dry-run=client \
#   appzone-ghcr-secret  --docker-username=$GITHUB_USER \
#   --docker-server=ghcr.io  --docker-email=lucas.sr.rg@gmail.com \
#   --docker-password=$CR_PAT  -o yaml \
#   | kubectl apply -f -
#kubectl apply -f $PWD/k8s/cert-manager.yml
#kubectl apply -f $PWD/k8s/mandatory-nginx-ingress.yml
#kubectl apply -f $PWD/k8s/nginx-ingress.yml
#sleep 30
#kubectl apply -f $PWD/k8s/cert-issuer.yml
#kubectl apply -f $PWD/k8s/external-dns.yml




