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

COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /application

RUN \
    set -xe \
    && wget -O composer.json -q https://raw.githubusercontent.com/shopware/development/${SHOPWARE_VERSION}/dev-ops/analyze/vendor-bin/cs-fixer/composer.json \
    && wget -O composer.lock -q https://raw.githubusercontent.com/shopware/development/${SHOPWARE_VERSION}/dev-ops/analyze/vendor-bin/cs-fixer/composer.lock \
    && composer install --no-interaction --no-progress --no-suggest --no-scripts --no-autoloader \
    && wget -O ecs.php -q "https://raw.githubusercontent.com/shopware/production/${SHOPWARE_VERSION}/easy-coding-standard.php"

VOLUME ["/src"]

ENTRYPOINT ["/entrypoint.sh"]
