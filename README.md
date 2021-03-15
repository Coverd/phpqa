# Coverd PHPQA custom image

Coverd needs a custom PHP QA docker image which contains some additional PHP extension.

Docker image is available on [Docker hub](https://hub.docker.com/repository/docker/coverd/phpqa).

## How to test your updated image locally?

1. Build the image

    docker build --tag coverd_phpqa_test --rm .
