ARG PHP_VERSION=8.0

FROM webdevops/php-dev:${PHP_VERSION}-alpine

ENV SHOPWARE_VERSION=6.4
ENV COMPOSER_VERSION=2
ENV PHP_MEMORY_LIMIT=4G
ENV PHP_MAX_EXECUTION_TIME=600
ENV PHP_DISPLAY_ERRORS=1
ENV PHP_DISPLAY_STARTUP_ERRORS=1
ENV PHP_ERROR_REPORTING=E_ALL

WORKDIR /application

COPY ./composer.json /application/composer.json
COPY ./entrypoint.sh /entrypoint.sh

RUN \
    set -xe \
    && composer install --no-cache --no-scripts

VOLUME ["/code"]

ENTRYPOINT ["/entrypoint.sh"]
