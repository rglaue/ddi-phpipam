FROM debian:stretch

#Install
RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update -qq \
    && apt-get -y install apache2 \
                          libapache2-mod-php \
                          php-mysql \
                          php-gmp \
                          php-gd \
                          php-ldap \
                          php-pear \
                          php-snmp \
                          php-mbstring \
                          pdns-server \
                          vim \
                          curl \
                          unzip \
                          kea-common \
    && apt-get autoclean

# Phpipam
ADD https://github.com/phpipam/phpipam/archive/master.zip /tmp
RUN unzip /tmp/master.zip -d /tmp/ \
    && cp -R /tmp/phpipam-master/* /var/www/html \
    && rm /var/www/html/index.html
COPY config/apache.conf /etc/apache2/sites-available/000-default.conf
COPY config/config.php /var/www/html

VOLUME ["/ssl"]

RUN a2enmod rewrite && /etc/init.d/apache2 restart

# apache env vars
ENV APACHE_LOCK_DIR /var/lock
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2/
ENV APACHE_PID_FILE /var/apache.pid

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
