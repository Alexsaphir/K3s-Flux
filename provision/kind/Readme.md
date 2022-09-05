# Quickly provision a kubernetes cluster using docker

```shell
rm ../kubeconfig-kind
kind delete cluster
kind create cluster --image=kindest/node:v1.24.4
kind get kubeconfig  > ../kubeconfig-kind
docker exec -it kind-control-plane apt update
docker exec -it kind-control-plane apt-get install -y open-iscsi
```

To use `longhorn`, we need `kubernetes<1.25`, due to `podsecuritypolicy` being removed.
The two last lines allow to install `longhorn` host dependencies.
