#!/bin/bash -e

for file in $(git diff --name-only --staged); do
    if [[ $file == *.php ]]; then
        cp $file /staged
    fi
done

if [ -e /src/ecs.php ]; then
    config="/src/ecs.php"
elif [ -e /src/easy-coding-standard.php ]; then
    config="/src/easy-coding-standard.php"
else
    config="/application/ecs.php"
fi

php /application/vendor/bin/ecs check --fix --config $config -- /staged
