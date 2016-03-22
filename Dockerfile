FROM alpine:latest
MAINTAINER Robert Weclawski <robert.weclawski@n-wms.com>

COPY scripts/docker_logo.txt /

RUN \
  apk update && \
  apk upgrade && \
  apk add \
    apache2 \
    apache2-ssl \
    apache2-utils \
    apache2-error \
    php-cli \
    php-phar \
    php-intl \
    php-mysql \
    php-xml \
    php-enchant \
    php-bcmath \
    php-apache2 \
    php-sysvsem \
    php-gd \
    php-pdo_mysql \
    php-opcache \
    php-posix \
    php-soap \
    php-openssl \
    php-json \
    php-zlib \
    bash \
    curl \
    ca-certificates && \
    echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update && \
    apk add php-redis@testing && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    mkdir -p /run/apache2/ && \
  cat docker_logo.txt
COPY scripts/etc/apache2/conf.d/ssl.conf /etc/apache2/conf.d/ssl.conf
COPY scripts/etc/apache2/conf.d/custom.conf /etc/apache2/conf.d/custom.conf
COPY scripts/var/www/localhost/htdocs/index.php /var/www/localhost/htdocs/
EXPOSE 80 443 843

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
