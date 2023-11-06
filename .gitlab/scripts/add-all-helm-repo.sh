#!/usr/bin/env bash


for file in cluster/flux/repositories/helm/*.yaml; do
    name=$(yq -r '.metadata.name' $file);
    url=$(yq -r '.spec.url' $file);

    if [ "$name" != "null" ]; then
        helm repo add "$name" "$url";
    fi;
done;

helm repo update
