FROM httpd:2.4


# Installation des dépendances du module apache auth_openidc
RUN  apt-get update \
    && apt-get install -y \
        libcurl3 \
        libhiredis0.10 \
        libjansson4 \
        wget \
        apache2.2-common
