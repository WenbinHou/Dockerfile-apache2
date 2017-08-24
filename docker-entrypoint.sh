#!/bin/bash

if [ ! -f "/etc/apache2/apache2.conf" ]; then
    cp -a /etc/apache2.bak/* /etc/apache2
fi

apache2ctl $@ -D FOREGROUND

