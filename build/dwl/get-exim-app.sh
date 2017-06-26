#! /bin/bash
if [ `find /home/${DWLC_USER_NAME}/files -mindepth 1 -maxdepth 1 | wc -l` == "0" ]; then
    git clone https://github.com/davask/exim-cms.git --branch lcdd --single-branch /home/${DWLC_USER_NAME}/files;
else
    ls -lah /home/${DWLC_USER_NAME}/files;
fi
