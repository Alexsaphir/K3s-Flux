INPUTS_PATH=cluster
INPUTS_SOURCES='cluster=./cluster/'


LOG_LEVEL=INFO # DEBUG or INFO

# Path to the root of the flux cluster GitRepository and Kustomization
INPUTS_PATH=${INPUTS_PATH:?Variable not set or empty}

# The name of the live branch to diff against, typically 'main' or 'master'.
INPUTS_LIVE_BRANCH=${INPUTS_LIVE_BRANCH:-main}

# Type of resource to diff, either 'kustomization' or 'helmrelease'.
INPUTS_RESOURCE=${INPUTS_RESOURCE:-kustomization}

# Number of diff lines to show.
INPUTS_DIFF_LINES=${INPUTS_DIFF_LINES:-6}

# When true, does not attempt to diff secrets.
INPUTS_SKIP_SECRETS=${INPUTS_SKIP_SECRETS:-true}

# When true, does not attempt to diff crds.
INPUTS_CRDS=${INPUTS_CRDS:-true}

# Kubernetes api versions used for helm Capabilities.APIVersions
INPUTS_API_VERSIONS=${INPUTS_API_VERSIONS:-'policy/v1/PodDisruptionBudget'}

# Labels and annotations that should be stripped to reduce diff noise.
INPUTS_STRIP_ATTRS=${INPUTS_STRIP_ATTRS:-'helm.sh/chart,checksum/config,app.kubernetes.io/version,chart'}

# Maximum number of bytes per individual diff (0=unlimited)
INPUTS_LIMIT_BYTES=${INPUTS_LIMIT_BYTES:-10000}

# Additional flags to pass to kustomize build
INPUTS_KUSTOMIZE_BUILD_FLAGS=${INPUTS_KUSTOMIZE_BUILD_FLAGS:-''}

# OCIRepository source mappings like `cluster=./cluster/`
INPUTS_SOURCES=${INPUTS_SOURCES:-''}

# matrix:
#        path: ["kubernetes"]
#        resource: ["helmrelease", "kustomization"]

flux-local \
  --log-level $LOG_LEVEL \
  diff $INPUTS_RESOURCE \
  --unified $INPUTS_DIFF_LINES \
  --path ./$INPUTS_PATH \
  --path-orig ../K3S-pr/$INPUTS_PATH \
  --strip-attrs $INPUTS_STRIP_ATTRS \
  --no-skip-crds \
  --skip-secrets \
  --limit-bytes $INPUTS_LIMIT_BYTES \
  --all-namespaces \
  --kustomize-build-flags="${INPUTS_KUSTOMIZE_BUILD_FLAGS}" \
  --sources $INPUTS_SOURCES
