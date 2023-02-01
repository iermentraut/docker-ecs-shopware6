#!/bin/bash -xe

if [ "$(ls -A /src)" ]; then
    if [ ! -e /src/ecs.php ] && [ ! -e /src/easy-coding-standard.php ]; then
        echo "[INFO] No ecs.php or easy-coding-standard.php found. Using default configuration \"https://raw.githubusercontent.com/shopware/production/${SHOPWARE_VERSION}/easy-coding-standard.php.\""

        /usr/local/bin/php /application/vendor/bin/ecs check --fix platform/src --config /application/ecs.php
    fi

    if [ -e /src/easy-coding-standard.php ]; then
        /usr/local/bin/php /application/vendor/bin/ecs check -c /application/easy-coding-standard.php --fix -- /src
    fi

    if [ -e /src/ecs.php ]; then
        /usr/local/bin/php /application/vendor/bin/ecs check -c /application/ecs.php --fix -- /src
    fi
else
    echo "Directory /src is empty. Skipping."
fi
