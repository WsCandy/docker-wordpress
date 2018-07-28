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
        imagemagick-dev \
    && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apk add --no-cache --update \
        imagemagick \
        libpng \
        libjpeg-turbo \
        freetype \
    && pecl install imagick \
    && docker-php-source extract \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr \
        --with-jpeg-dir=/usr \
        --with-png-dir=/usr \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install \
        gd \
        pdo_mysql \
        mysqli \
    && composer install --no-dev \
    && rm -rf /usr/local/bin/composer \
    && rm -rf /var/www/html/vendor \
    && rm /var/www/html/composer.json \
    && rm /var/www/html/composer.lock \
    && cd httpdocs \
    && ln -s wordpress/index.php index.php \
    && docker-php-source delete \
    && apk del --purge .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

EXPOSE 9000

CMD ["php-fpm"]