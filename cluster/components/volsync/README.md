## Variables

| Name                    | Default              | Description                  |
|-------------------------|----------------------|------------------------------|
| **PVC_NAME**            |                      |                              |
| `VOLSYNC_CAPACITY`      | `5Gi`                |                              |
| `VOLSYNC_STORAGECLASS`  | `longhorn`           |                              |
| `VOLSYNC_SNAPSHOTCLASS` | `longhorn-snapclass` | `snapshot.storage.k8s.io/v1` |
| `VOLSYNC_ACCESSMODES`   | `ReadWriteOnce`      |                              |

| Name                       | Default         | Description |
|----------------------------|-----------------|-------------|
| `VOLSYNC_SNAP_ACCESSMODES` | `ReadWriteOnce` |             |

| Name                          | Default            | Description |
|-------------------------------|--------------------|-------------|
| `VOLSYNC_CACHE_ACCESSMODES`   | `ReadWriteOnce`    |             |
| `VOLSYNC_CACHE_CAPACITY`      | `5Gi`              |             |
| `VOLSYNC_CACHE_SNAPSHOTCLASS` | `openebs-hostpath` |             |

| Name           | Default | Description |
|----------------|---------|-------------|
| `VOLSYNC_PUID` | `1000`  |             |
| `VOLSYNC_PGID` | `1000`  |             |
| `VOLSYNC_PGID` | `1000`  |             |
