#!/bin/bash
docker build -t shopware-ecs-docker:6.4-php8.0 --build-arg SHOPWARE_VERSION=6.4 --build-arg PHP_VERSION=8.0 .
docker build -t shopware-ecs-docker:6.3-php8.0 --build-arg SHOPWARE_VERSION=6.3 --build-arg PHP_VERSION=8.0 .
