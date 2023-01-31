#!/bin/bash -xe

if [ "$(ls -A /code)" ]; then
    /usr/local/bin/php /application/vendor/bin/ecs check -c "$(pwd)/easy-coding-standard.php" --fix -- /code
else
    echo "No files to check. Skipping."
fi
