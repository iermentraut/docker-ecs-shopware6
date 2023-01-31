ARG PHP_VERSION=8.0
ARG SHOPWARE_VERSION=v6.4.0.0

FROM webdevops/php-dev:${PHP_VERSION}-alpine

ARG SHOPWARE_VERSION

ENV COMPOSER_VERSION=2
ENV PHP_MEMORY_LIMIT=4G
ENV PHP_MAX_EXECUTION_TIME=600
ENV PHP_DISPLAY_ERRORS=1
ENV PHP_DISPLAY_STARTUP_ERRORS=1
ENV PHP_ERROR_REPORTING=E_ALL

WORKDIR /application

COPY ./composer.json /application/composer.json
COPY ./entrypoint.sh /entrypoint.sh

USER application

RUN \
    set -xe \
    && composer require --no-cache --no-scripts symplify/easy-coding-standard "^11.2" \
    && wget -O /application/easy-coding-standard.php -q \
        "https://raw.githubusercontent.com/shopware/production/${SHOPWARE_VERSION}/easy-coding-standard.php"

VOLUME ["/src"]

ENTRYPOINT ["/entrypoint.sh"]
