FROM debian:stretch

# Requirements
RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update -qq \
    && apt-get -y install apache2 \
      libapache2-mod-php \
      php-mysql \
      php-gmp \
      php-gd \
      php-ldap \
      php-pear \
      pdns-server \
      vim \
      curl \
      unzip \
      libssl-dev \
      build-essential \
      libboost-dev \
      liblog4cplus-dev \
      make \
      git \
      mysql-client \
    && apt-get clean

# Kea DHCP
ADD http://ftp.isc.org/isc/kea/1.1.0-beta/kea-1.1.0-beta.tar.gz /tmp/
RUN tar -xzf /tmp/kea-1.1.0-beta.tar.gz -C /tmp/ \
    && cd /tmp/kea-1.1.0-beta \
    && ./configure --prefix=/ \
    && make \
    && make install

# Phpipam
ADD https://github.com/phpipam/phpipam/archive/master.zip /tmp
RUN unzip /tmp/master.zip -d /tmp/ \
    && cp -R /tmp/phpipam-master/* /var/www/html \
    && rm /var/www/html/index.html
COPY 000-default.conf /etc/apache2/sites-available/default
COPY config.php /var/www/html

VOLUME ["/ssl"]

RUN a2enmod rewrite && /etc/init.d/apache2 restart

# apache env vars
ENV APACHE_LOCK_DIR /var/lock
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2/
ENV APACHE_PID_FILE /var/apache.pid

# Defaults
ENV SSL_ENABLED false
ENV PROXY_ENABLED false
ENV PROXY_USEAUTH false

# Clean

#RUN apt-get autoremove vim curl unzip libssl-dev build-essential libboost-dev liblog4cplus-dev make git mysql-client \
#    &&  apt-get autoclean \
#    && rm -R /tmp/*

EXPOSE 80 443

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
