#!/bin/bash

/usr/local/bin/php -d memory_limit=4G /root/vendor/bin/ecs check -c /easy-coding-standard.php --fix -- /src
