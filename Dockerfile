FROM httpd:2.4

RUN set -ex; \
        echo 'deb http://ftp.debian.org/debian stretch main contrib non-free' >> /etc/apt/sources.list

# Installation des dépendances du module apache auth_openidc
RUN  apt-get update \
    && apt-get install -y \
        libcurl3 \
        libhiredis0.10 \
        libjansson4 \
        wget \
        apache2.2-common
