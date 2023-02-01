#!/bin/bash -xe

if [ "$(ls -A /src)" ]; then
    if [ ! -e /src/ecs.php ] && [ ! -e /src/easy-coding-standard.php ]; then
        /usr/local/bin/php /application/vendor/bin/ecs check --fix --config /application/ecs.php -- /src
    fi

    if [ -e /src/easy-coding-standard.php ]; then
        /usr/local/bin/php /application/vendor/bin/ecs check --fix --config /application/easy-coding-standard.php -- /src
    fi

    if [ -e /src/ecs.php ]; then
        /usr/local/bin/php /application/vendor/bin/ecs check --fix --config /application/ecs.php -- /src
    fi
else
    echo "Directory /src is empty. Skipping."
fi
