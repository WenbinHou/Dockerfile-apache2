#!/bin/bash

docker build --rm --force-rm --no-cache --tag catchyrime/apache2 "$(dirname "$0")"

