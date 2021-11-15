ARG PHP_VERSION=8.0

FROM webdevops/php-dev:${PHP_VERSION}-alpine

ARG SHOPWARE_VERSION=6.4

WORKDIR /root

COPY ./ /

RUN \
    set -xe \
    && composer require --no-cache --no-scripts symplify/easy-coding-standard --dev \
    && wget -q "https://raw.githubusercontent.com/shopware/production/${SHOPWARE_VERSION}/easy-coding-standard.php"

VOLUME ["/src"]

ENTRYPOINT ["/entrypoint.sh"]
