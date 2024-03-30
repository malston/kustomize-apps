# Example: WordPress and MySQL on Kubernetes

This directory contains the Kubernetes manifest files of the WordPress and
MySQL [tutorial](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/) for Kubernetes.

## Transfer Images

Download images from Docker and transfer them to Harbor

    ../../scripts/copy-images.sh -m images.yml

## Deploy

Apply based upon your choice of storage

* thin-disk

    ```sh
    ./kustomize.sh apply overlays/dev-thin-disk
    ```

* nas-performance

    ```sh
    ./kustomize.sh apply overlays/dev-nas-performance
    ```

* nas-ultra

    ```sh
    ./kustomize.sh apply overlays/dev-nas-ultra
    ```
