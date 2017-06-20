#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

##############
# Dockerfile #
##############

echo "FROM davask/d-symfony:${parentBranch}
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.app.cms=\"eXim\"" > ${rootDir}/Dockerfile
echo "
RUN apt-get update &&  apt-get install -y \
php${PHP_VERSION:0:1}-ssh2 \
default-jre \
ruby \
rubygems

RUN apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

RUN gem update --system
RUN gem install sass
RUN gem install compass

RUN rm -rdf /dwl/default/var/www/html
RUN git clone https://github.com/davask/exim-cms.git --branch lcdd --single-branch /dwl/default/var/www/html

# COPY ./build/dwl/default/var/www/html /dwl/default/var/www/html
COPY ./build/dwl/update-exim-db.sh /dwl/update-exim-db.sh
COPY ./build/dwl/prepare-exim.sh /dwl/prepare-exim.sh
COPY ./build/dwl/init.sh /dwl/init.sh
" >> ${rootDir}/Dockerfile

echo "Dockerfile generated with exim";
