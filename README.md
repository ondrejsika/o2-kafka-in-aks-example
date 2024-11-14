# o2-kafka-in-aks-example

## Create Cluster

```
cd azure
```

Apply Terraform

```
terraform init
terraform apply
```

```
az account set --subscription 200acaec-2d60-43ad-915a-e8f5352a4ba7
az aks get-credentials --resource-group o2-aks-kafka-example --name o2-aks-kafka-example --overwrite-existing
```

## Install ArgoCD

```
slu scripts kubernetes install-argocd --domain argocd.o2.sikademo.com
```
