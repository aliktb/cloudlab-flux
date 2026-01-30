#!/usr/bin/env bash

# Create the external-secrets namespace and secret as these need to be
# available to create the ClusterSecretStore for ESO
#
# Currently, there is no IRSA in Scaleway so an access key pair secret needs
# to exist so ESO can pull from the secret manager
#
# No harm in keeping the namespace manifest but the secret is created
# as a prerequisite to having flux bootstrapped
kubectl create namespace external-secrets
kubectl create secret -n external-secrets generic scaleway-eso-credentials --from-env-file=.env.scaleway

# Create secret to allow Flux Operator to pull git repo
kubectl create namespace flux-system
kubectl -n flux-system create secret generic github-token --from-env-file=.env.github

# Bootstrap Flux Operator
flux-operator install -f flux-instance.yaml
