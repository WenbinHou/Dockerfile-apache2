#!/bin/bash -xe

docker build --rm --force-rm --no-cache --tag catchyrime/apache2 "$(dirname "$0")"

docker push catchyrime/apache2

