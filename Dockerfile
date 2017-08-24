
FROM ubuntu:16.04

MAINTAINER Wenbin Hou <catchyrime@fastmail.com>

SHELL [ "/bin/bash", "-c" ]

ENV DEBIAN_FRONTEND="noninteractive"

ARG LOCALE="en_US.UTF-8"

RUN \
    set -xe; \
    APT_OPTION='--quiet --quiet --yes'; \
    apt-get $APT_OPTION update; \
    apt-get $APT_OPTION install apt-utils; \
    \
    apt-get $APT_OPTION install locales; \
    locale-gen "$LOCALE"; \
    dpkg-reconfigure locales; \
    export LC_ALL="$LOCALE"; \
    export LANG="$LOCALE"; \
    export LANGUAGE="$LOCALE"; \
    \
    apt-get $APT_OPTION install \
        apt-transport-https curl less \
        software-properties-common vim wget; \
    \
    add-apt-repository --yes --update ppa:ondrej/apache2; \
    apt-get $APT_OPTION install apache2 apache2-utils; \
    mv /etc/apache2 /etc/apache2.bak; \
    \
    apt-get $APT_OPTION autoclean; \
    rm -rf /var/lib/apt/lists/*


COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]


EXPOSE 80/tcp
EXPOSE 443/tcp

VOLUME /var/www
VOLUME /etc/apache2

