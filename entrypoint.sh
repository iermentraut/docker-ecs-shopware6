#!/bin/bash -xe

if [ "$(ls -A /src)" ]; then
    /usr/local/bin/php /application/vendor/bin/ecs check -c "$(pwd)/easy-coding-standard.php" --fix -- /src
else
    echo "No files to check. Skipping."
fi
