# Applications using Trident CSI

## Basic Pod with a PVC

This [app](./basic/README.md) creates a `Pod` that binds to a Trident provisioned `PersistentVolume` using the `nas-standard` `StorageClass`.

## Guestbook with MongoDB or Redis

This [app](./guestbook/README.md) creates a `Deployment` using Trident provisioned `PersistentVolume` using one of the Trident provided `StorageClass` options.

## Wordpress with MySQL

This [app](./mysql-wordpress/README.md) creates a `Deployment` using Trident provisioned `PersistentVolume` using one of the Trident provided `StorageClass` options.

## Wordpress with PostgreSQL

This [app](./postgres-wordpress/README.md) creates a `StatefulSet` using Trident provisioned `PersistentVolume` using one of the Trident provided `StorageClass` options.

## Wordpress from Bitnami Helm Chart

This [app](./bitnami-wordpress/README.md) creates a `StatefulSet` using Trident provisioned `PersistentVolume` using one of the Trident provided `StorageClass` options.
