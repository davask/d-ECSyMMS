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
ENV
RUN apt-get update &&  apt-get install -y \
php${PHP_VERSION}-bcmath \
php${PHP_VERSION}-ssh2 \
default-jre \
ruby \
ruby-dev \
rubygems

RUN apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

RUN gem update --system
RUN gem install sass compass

COPY ./build/dwl/setup-exim-app.sh \
./build/dwl/get-exim-app.sh \
./build/dwl/update-exim-db.sh \
./build/dwl/prepare-exim.sh \
/dwl/
USER admin
" >> ${rootDir}/Dockerfile

echo "Dockerfile generated with exim";
