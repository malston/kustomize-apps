# Example: WordPress and PostgreSQL on Kubernetes

This directory contains the Kubernetes manifest files of the WordPress and
PostgreSQL [tutorial](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/) for Kubernetes.

## Transfer Images

Download images from Docker and transfer them to Harbor

    ../../scripts/copy-images.sh -m images.yml

## Deploy

Apply based upon your choice of storage

- **thin-disk**

        clusterDomain=cluster03.markalston.net kubectl apply -k ./thin-disk

- **nas-standard**

        clusterDomain=cluster03.markalston.net kubectl apply -k ./nas-standard

- **nas-performance**

        clusterDomain=cluster03.markalston.net kubectl apply -k ./nas-performance

- **nas-extreme**

        clusterDomain=cluster03.markalston.net kubectl apply -k ./nas-extreme
