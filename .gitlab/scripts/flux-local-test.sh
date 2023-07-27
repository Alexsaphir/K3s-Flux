INPUTS_PATH=cluster
#INPUTS_SOURCES='cluster=./cluster/'

LOG_LEVEL=INFO # DEBUG or INFO

# Path to the root of the flux cluster GitRepository and Kustomization.
INPUTS_PATH=${INPUTS_PATH:?Variable not set or empty}

# Build HelmRelease objects and validate outputs.
INPUTS_ENABLE_HELM=${INPUTS_ENABLE_HELM:-true}

# Kubernetes api versions used for helm Capabilities.APIVersions.
INPUTS_API_VERSIONS=${INPUTS_API_VERSIONS:-'policy/v1/PodDisruptionBudget'}

# Validate cluster resources against kyverno policies found in the cluster.
INPUTS_ENABLE_KYVERNO=${INPUTS_ENABLE_KYVERNO:-false}

# Kyverno version to use when enabled.
INPUTS_KYVERNO_VERSION=${INPUTS_KYVERNO_VERSION:-v1.9.0}

# Additional flags to pass to kustomize build.
INPUTS_KUSTOMIZE_BUILD_FLAGS=${INPUTS_KUSTOMIZE_BUILD_FLAGS:-''}

# OCIRepository source mappings like `cluster=./kubernetes/`.
INPUTS_SOURCES=${INPUTS_SOURCES:-''}

# matrix:
#        path: ["kubernetes"]
#        resource: ["helmrelease", "kustomization"]

flux-local \
  --log-level $LOG_LEVEL \
  test \
  --enable-helm \
  --skip-secrets \
  --no-enable-kyverno \
  --api-versions "$INPUTS_API_VERSIONS" \
  --kustomize-build-flags="$INPUTS_KUSTOMIZE_BUILD_FLAGS" \
  --sources "$INPUTS_SOURCES" \
  --path $INPUTS_PATH
