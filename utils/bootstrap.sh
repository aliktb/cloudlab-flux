#!/usr/bin/env bash

flux bootstrap github \
  --token-auth \
  --owner=aliktb \
  --repository=cloudlab-flux \
  --branch=initial-config \
  --path=clusters/aliktb-dev \
  --personal
