#!/bin/bash
sfbin="app";
if [ ! -f /home/${DWLC_USER_NAME}/files/${sfbin}/console ]; then
    sfbin="bin";
fi
php /home/${DWLC_USER_NAME}/files/${sfbin}/console doctrine:schema:update --force;
