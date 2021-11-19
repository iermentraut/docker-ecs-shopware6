ARG \
    COMPOSER_IMAGE_VERSION=2.1.3 \
    PHP_VERSION=8.0 \
    PLATFORM=alpine \
    ECS_PACKAGE_VERSION=9.4.70 \
    SHOPWARE_VERSION=6.4

FROM composer:${COMPOSER_IMAGE_VERSION} AS build

ARG \
    PHP_VERSION \
    PLATFORM \
    ECS_PACKAGE_VERSION

RUN \
  set -xe && \
  composer --quiet --no-cache global require \
    symplify/easy-coding-standard:${ECS_PACKAGE_VERSION}

FROM php:${PHP_VERSION}-cli-${PLATFORM}

ARG \
    SHOPWARE_VERSION

LABEL Maintainer="Igor Ermentraut <ie@efsa.io>"

USER root

COPY ./alpine /docker
COPY ./tests /application

RUN \
    chmod +x /docker/application_user.sh && \
    sh /docker/application_user.sh

USER application

WORKDIR /application

RUN \
    set -xe \
    && wget -q "https://raw.githubusercontent.com/shopware/production/${SHOPWARE_VERSION}/easy-coding-standard.php"

WORKDIR /src

VOLUME ["/src"]

COPY --chown=application:application --from=build /tmp/vendor /application/vendor

ENTRYPOINT ["/application/vendor/bin/ecs"]

CMD ["--help"]