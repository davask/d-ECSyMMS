#! /bin/bash

# src : https://symfony.com/doc/current/bundles/SonataAdminBundle/getting_started/installation.html
# composer require sonata-project/admin-bundle;
# composer require sonata-project/doctrine-orm-admin-bundle;

sfbin="app";
if [ ! -f /home/${DWLC_USER_NAME}/files/${sfbin}/console ]; then
    sfbin="bin";
fi
php /home/${DWLC_USER_NAME}/files/${sfbin}/console cache:clear;
php /home/${DWLC_USER_NAME}/files/${sfbin}/console assets:install --symlink;

# add command to execute default admin and exports
# php app/console fos:user:create --super-admin dwl ${DWLC_USER_NAME}@localhost secret
