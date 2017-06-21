FROM davask/d-symfony:2.8-p5.6-a2.4-d8.8
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.app.cms="eXim"

RUN apt-get update &&  apt-get install -y php5-ssh2 default-jre ruby rubygems

RUN apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

RUN gem update --system
RUN gem install sass
# RUN gem install compass

# todo manualy git clone https://github.com/davask/exim-cms.git --branch lcdd --single-branch /dwl/default/var/www/html

RUN rm -rdf /dwl/default/var/www/html
COPY ./build/dwl/default/var/www/html /dwl/default/var/www/html

COPY ./build/dwl/update-exim-db.sh ./build/dwl/prepare-exim.sh ./build/dwl/init.sh /dwl/
USER admin

