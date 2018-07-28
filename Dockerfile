FROM php:7.2.8-fpm-alpine

COPY config/php.ini /usr/local/etc/php
COPY composer.json /var/www/html
COPY composer.lock /var/www/html
COPY httpdocs /var/www/html/httpdocs

WORKDIR /var/www/html

RUN apk add --no-cache --update --virtual .build-deps \
        autoconf \
        g++ \
        make \
        pcre-dev \
        bash \
        libjpeg-turbo-dev \
        freetype-dev \
        libpng-dev \
    && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apk add --no-cache --update \
        libpng \
        libjpeg-turbo \
        freetype \
    && docker-php-source extract \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr \
        --with-jpeg-dir=/usr \
        --with-png-dir=/usr \
    && docker-php-ext-install \
        gd \
        pdo_mysql \
        mysqli \
    && composer install --no-dev \
    && rm -rf /usr/local/bin/composer \
    && rm -rf /var/www/html/vendor \
    && rm /var/www/html/composer.json \
    && rm /var/www/html/composer.lock \
    && mkdir -p /var/www/html/httpdocs/wp/uploads \
    && mkdir -p /var/www/html/httpdocs/wp/themes \
    && mv /var/www/html/httpdocs/wordpress/wp-content/themes/twentyseventeen /var/www/html/httpdocs/wp/themes/twentyseventeen \
    && cd httpdocs \
    && ln -s wordpress/index.php index.php \
    && docker-php-source delete \
    && apk del --purge .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && echo "Fixing file permissions..." \
    && find /var/www/html -type d -exec chmod 0775 {} \; -exec chgrp www-data {} \; \
    && find /var/www/html -type f -exec chmod 0664 {} \; -exec chgrp www-data {} \;

EXPOSE 9000

CMD ["php-fpm"]