#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

#############
# README.md #
#############

echo "# dockerfile

see [FROM IMAGE README.md](https://github.com/davask/d-php-letsencrypt)

### ECSyMMS  ${ECSyMMS_VERSION} activation

#### comment

[handler_id](http://symfony.com/doc/current/reference/configuration/framework.html#handler-id)

> type: string default: 'session.handler.native_file'

> The service id used for session storage. The session.handler service alias will be set to this service id.

> You can also set it to null, to default to the handler of your PHP installation.

> You can see an example of the usage of this in How to Use PdoSessionHandler to Store Sessions in the Database.

The following session handler can generate issues.

##### app\config\config.yml

\`\`\`yml

framework:
    framework:
        session:
            handler_id:  session.handler.native_file
             save_path:   "%kernel.root_dir%/../var/sessions/%kernel.environment%"

\`\`\`

To avoid issues you can use one of these following solutions (only the default handler have been tested)

##### app\config\config.yml

default php handler

\`\`\`yml

framework:
    framework:
        session:
            handler_id:  ~

\`\`\`

[memcached handler](https://github.com/symfony/symfony/issues/17845#issuecomment-195285004)

\`\`\`yml

framework:
    framework:
        session:
            # handler_id:  session.handler.memcached

\`\`\`

[PDO Handler](http://symfony.com/doc/current/doctrine/pdo_session_storage.html)

\`\`\`yml

framework:
    framework:
        session:
            # handler_id: session.handler.pdo

\`\`\`


## LABEL

> dwl.app.cms=\"ECSyMMS ${ECSyMMS_VERSION}\"
" > ${rootDir}/README.md

echo "README.md generated with ECSyMMS:${branch}";
