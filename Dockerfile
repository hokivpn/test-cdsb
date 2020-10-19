FROM httpd:2.4

RUN set -ex; \
        echo 'deb http://ftp.debian.org/debian stretch main contrib non-free' >> /etc/apt/sources.list

# Installation des dépendances du module apache auth_openidc
RUN  apt-get update \
    && apt-get install -y \
        libcurl4 \
        libhiredis0.13 \
        libjansson4 \
        wget \
        apache2-bin \
        apache2

# Installation du module apache auth_openidc
RUN wget https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.0/libcjose0_0.5.1-1.jessie.1_amd64.deb \
    && dpkg -i libcjose0_0.5.1-1.jessie.1_amd64.deb && rm libcjose0_0.5.1-1.jessie.1_amd64.deb
         

RUN wget https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.3/libapache2-mod-auth-openidc_2.3.3-1.jessie.1_amd64.deb \
    && dpkg -i libapache2-mod-auth-openidc_2.3.3-1.jessie.1_amd64.deb && rm libapache2-mod-auth-openidc_2.3.3-1.jessie.1_amd64.deb

RUN a2enmod auth_openidc
