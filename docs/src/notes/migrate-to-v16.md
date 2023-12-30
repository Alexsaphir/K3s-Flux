The goal is to upgrade postgres from v15 to v16.

To do that, we are going to create a second cluster running the new version of postgres referencing the old cluster
as source.

The new cluster is named `postgres-16` while the old one is named `postgres`.

## Main procedure

Applying the following definition for the new cluster will allow us to replicate the old cluster but
with a recent version of postgres.

```yaml
---
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: postgres-16
  namespace: database
  annotations:
    kyverno.io/ignore: "true"

spec:
  imageName: ghcr.io/bo0tzz/cnpgvecto.rs:16.1-v0.1.11
  instances: 2
  enableSuperuserAccess: true
  resources:
    requests:
      memory: "2Gi"
  storage:
    size: 10Gi
    storageClass: local-path
  postgresql:
    parameters:
      max_connections: "800"
      max_slot_wal_keep_size: 10GB
      shared_buffers: "512MB"
    shared_preload_libraries:
      - "vectors.so"

  bootstrap:
    initdb:
      import:
        type: monolith
        databases: [ "*" ]
        roles: [ "*" ]
        source:
          externalCluster: &previousCluster cnpg-live

  backup:
    retentionPolicy: 30d
    barmanObjectStore:
      serverName: &currentCluster postgres-16-v1
      wal:
        compression: &compression bzip2
        maxParallel: &maxParallel 4

      data:
        compression: *compression

      destinationPath: &destinationPath 's3://cloudnativepg-backup/'
      endpointURL: &endpoint 'https://s3.alexsaphir.com'
      s3Credentials:
        accessKeyId:
          name: &s3Credentials-secret postgres-backup-secret
          key: &s3Credentials-accessKeyId-key ACCESS_KEY_ID
        secretAccessKey:
          name: *s3Credentials-secret
          key: &s3Credentials-secretAccessKey-key ACCESS_SECRET_KEY

  externalClusters:
    - name: *previousCluster
      connectionParameters:
        # Use the correct IP or host name for the source database
        host: postgres-rw.database.svc.cluster.local
        user: postgres
        dbname: postgres
        sslmode: require
      password:
        name: postgres-superuser
        key: password
```

Using kubectl, we create the cluster named `postgres-16`:

```shell
kubectl apply -f postgres-16.yaml
```

When the cluster is ready, we create a backup of the new cluster:

```shell
kubectl-cnpg backup postgres-16 -n database
```

We can delete this new cluster.

```shell
kubectl delete -f postgres-16.yaml
```

Finally, update the image and set the external cluster to the backup created by the new cluster.

## Housekeeping

- Drop timescaledb

```postgresql
drop database codecov-timeseries;
drop extension timescaledb;
```
- Fix immich

open console for immich database

```postgresql
ALTER EXTENSION cube SET SCHEMA pg_catalog;
ALTER EXTENSION earthdistance SET SCHEMA pg_catalog;
```
