#! /bin/bash

cd .; cd -;

dwlDir="/dwl";

. ${dwlDir}/envvar.sh
echo ">> Env initialized";

. ${dwlDir}/permission.sh
echo ">> Permission assigned";

. ${dwlDir}/get-exim-app.sh
. ${dwlDir}/prepare-symfony-app.sh
echo ">> Symfony initialized";

. ${dwlDir}/update-exim-db.sh
. ${dwlDir}/prepare-exim.sh
echo ">> eXim initialized";

. ${dwlDir}/fix-symfony-permissions.sh
echo ">> fix Symfony initialized";
