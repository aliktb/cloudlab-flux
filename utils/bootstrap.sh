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


# Bootstrap cluster with Flux CLI
flux bootstrap github \
  --token-auth \
  --owner=aliktb \
  --repository=cloudlab-flux \
  --branch=initial-config \
  --path=clusters/aliktb-dev \
  --personal
