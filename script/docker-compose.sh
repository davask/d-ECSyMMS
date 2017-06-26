#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

######################
# docker-compose.yml #
######################

echo "d-exim:
  ports:
  - 65400:80/tcp
  - 65402:22/tcp
  - 65403:443/tcp
  environment:
    DWL_LOCAL: en_US.UTF-8
    DWL_USER_ID: '1000'
    DWL_USER_PASSWD: secret
    DWL_LOCAL_LANG: en_US:en
    DWL_USER_NAME: username
    DWL_SSH_ACCESS: 'true'
    DWL_SHIELD_HTTP: 'false'
    DWL_SSLKEY_C: EU
    DWL_SSLKEY_ST: France
    DWL_SSLKEY_L: Vannes
    DWL_SSLKEY_O: davask web limited - docker container
    DWL_SSLKEY_CN: davaskweblimited.com
    DWL_CERTBOT_EMAIL: docker@davaskweblimited.com
    DWL_CERTBOT_DEBUG: 'false'
    DWL_PHP_DATETIMEZONE: Europe/Paris
  image: davask/d-ecsymms:${branch}
  hostname: localhost
  net: bridge
  volumes:
  - ${rootDir}/volumes/etc/letsencrypt:/etc/letsencrypt
  - ${rootDir}/volumes/etc/apache2/ssl:/etc/apache2/ssl
  - ${rootDir}/volumes/var/log/localhost/apache2:/var/log/apache2
  - ${rootDir}/volumes/home/username/http/app/sites-available:/etc/apache2/sites-available
  - ${rootDir}/volumes/home/username/files:/home/username/files
  - ${rootDir}/volumes/home/username/.composer:/home/username/.composer
  working_dir: /var/www/html
  # mem_limit: 512
d-exim-mysql:
  ports:
  - 65401:3306/tcp
  - 65404:22/tcp
  environment:
    MYSQL_ROOT_PASSWORD: secret
    MYSQL_PASSWORD: secret
    MYSQL_DATABASE: symfony
    MYSQL_USER: username
    DWL_USER_ID: '1000'
    DWL_USER_PASSWD: secret
    DWL_USER_NAME: username
  hostname: localhost
  image: mysql:latest
  restart: always
  volumes:
  - ${rootDir}/volumes/home/username/db/my.cnf:/etc/alternatives/my.cnf
  - ${rootDir}/volumes/home/username/db/mysql:/docker-entrypoint-initdb.d
  - ${rootDir}/volumes/home/username/exports/mysql:/home/username/exports/mysql
  - ${rootDir}/volumes/home/username/data/mysql:/var/lib/mysql

# docker-compose -f ${HOME}/docker-images/app/d-ECSyMMS/docker-compose.yml up -d
" > ${rootDir}/docker-compose.yml

echo "docker-compose.yml generated with ECSyMMS:${branch}";
