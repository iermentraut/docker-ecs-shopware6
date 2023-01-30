#!/bin/bash -xe

wget -q "https://raw.githubusercontent.com/shopware/production/${SHOPWARE_VERSION}/easy-coding-standard.php"

/usr/local/bin/php /application/vendor/bin/ecs check -c "$(pwd)/easy-coding-standard.php" --fix -- /code
