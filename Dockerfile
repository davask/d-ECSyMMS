FROM davask/d-symfony:2.8-p5.6-a2.4-d8.8
MAINTAINER davask <docker@davaskweblimited.com>
USER root
RUN apt-get update && apt-get install -y \
php-bcmath \
php-ssh2 \
default-jre \
ruby \
ruby-dev \
rubygems

RUN apt-get upgrade -y && \
apt-get autoremove -y && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem update --system
RUN gem install sass compass

COPY ./build/dwl/setup-exim-app.sh ./build/dwl/get-exim-app.sh ./build/dwl/update-exim-db.sh ./build/dwl/prepare-exim.sh /dwl/

# CMD ["/dwl/init.sh && service sendmail start && apache2ctl -D FOREGROUND"]

RUN chmod +x /dwl/init.sh && chown root:sudo -R /dwl
USER admin
