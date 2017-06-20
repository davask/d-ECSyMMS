FROM davask/d-symfony:2.8-p5.6-a2.4-d8.8
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.app.cms="eXim"

RUN apt-get update && apt-get install -y php5-ssh2
# RUN apt-get install -y php5-bcmath

RUN apt-get install -y default-jre
RUN apt-get install -y ruby # u14.04 only ?
# RUN apt-get install -y rubygems # u16.04 ?
RUN apt-get install -y ruby-dev # u14.04 only ?

RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN gem install rubygems-update # u14.04 only ?
RUN update_rubygems --no-document # u14.04 only ?
# RUN gem update --system # u16.04 ?
RUN gem install sass
RUN gem install compass

RUN rm -rdf /dwl/default/var/www/html
RUN git clone https://github.com/davask/exim-cms.git --branch lcdd --single-branch /dwl/default/var/www/html

# COPY ./build/dwl/default/var/www/html /dwl/default/var/www/html
COPY ./build/dwl/update-exim-db.sh /dwl/update-exim-db.sh
COPY ./build/dwl/prepare-exim.sh /dwl/prepare-exim.sh
COPY ./build/dwl/init.sh /dwl/init.sh

