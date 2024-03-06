# Example: Bitnami Wordpress Helm Chart

This directory contains the Kubernetes manifest files of the WordPress and MariaDB using the [Bitnami Helm Chart](https://github.com/bitnami/charts/tree/main/bitnami/wordpress).

## Transfer Images

Download images from Docker and transfer them to Harbor

    ../../scripts/copy-images.sh -m images.yml

## Deploy

Apply based upon your choice of storage

- **thin-disk**

        ./run.sh apply dev $CLUSTER_DOMAIN

    where `$CLUSTER_DOMAIN` is the tld for wordpress.
    (i.e., example.com)

- **nas-performance**

        ./run.sh apply prod $CLUSTER_DOMAIN
