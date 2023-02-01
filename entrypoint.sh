#!/bin/bash -xe

if [ "$(ls -A /src)" ]; then
    /usr/local/bin/php /application/vendor/bin/ecs check -c /application/ecs.php --fix -- /src
else
    echo "No files to check. Skipping."
fi
