#!/bin/bash

echo 'Updating container image tag in dev overlay...'
CONTAINER_IMAGE_TAG="$(node -e "console.log(require('../application/package.json').version);")" yq eval -i '
  .images[0].newTag = env(CONTAINER_IMAGE_TAG)
' ./overlays/dev/kustomization.yaml

echo 'Container image tag updated in kustomize overlay for dev...'
echo 'Creating new deployment manifest file...'

../../kustomize build overlays/dev > ../k8s-manifests/deployment.yaml

echo 'Updated the deployment manifest file being watched by GitOps tool...'