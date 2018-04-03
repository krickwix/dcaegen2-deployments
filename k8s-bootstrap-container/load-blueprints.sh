#!/bin/bash
# Load DCAE blueprints/inputs onto container
# $1 Blueprint repo base URL
# Expect blueprints to be at <base URL>/blueprints

set -x

BLUEPRINTS=\
"
k8s-config_binding_service.yaml  \
k8s-deployment_handler.yaml  \
k8s-inventory.yaml  \
k8s-policy_handler.yaml
"

BPDEST=blueprints
mkdir ${BPDEST}

# Download blueprints
for bp in ${BLUEPRINTS}
do
    curl -Ss $1/blueprints/${bp} > ${BPDEST}/$(basename ${bp})
done