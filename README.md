# Shopware 6 easy-coding-standard

This image runs ECS inside a Docker container. This allows you to use this
image to run as a pre-commit hook.

## pre-commit hook

```yaml
---
default_language_version:
    python: python3

default_stages: [commit, push]

repos:
    - repo: local
      hooks:
          - id: shopware-ecs-docker
            name: shopware-ecs-docker
            language: docker_image
            entry: ghcr.io/iermentraut/shopware-ecs-docker:6.4-php8.0
            types: [file]
            files: *\.php$
```

## Available version

List of [all versions](https://github.com/iermentraut/shopware-ecs-docker/pkgs/container/shopware-ecs-docker/versions)
