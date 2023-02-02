# Easy Coding Standard (ECS) Docker images for Shopware 6

This image runs ECS inside Docker containers. This allows you to use this
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
      - id: easy-coding-standard
        name: easy-coding-standard
        entry: ghcr.io/iermentraut/docker-ecs-shopware:6.4.15.1-php8.0
        language: docker_image
        types: [file, php]
        verbose: true
        require_serial: true
```
