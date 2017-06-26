#! /bin/bash
if [ `find /home/${DWLC_USER_NAME}/files -mindepth 1 -maxdepth 1 | wc -l` == "0" ]; then
    echo "################################################################################################################################";
    echo "# [RUN FROM BASH] git clone https://github.com/davask/exim-cms.git --branch lcdd --single-branch /home/${DWLC_USER_NAME}/files #";
    echo "################################################################################################################################";
else
    echo "eXim app is not installed because there's file(s) in /home/${DWLC_USER_NAME}/files";
fi
