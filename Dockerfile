FROM jakzal/phpqa:php7.4-alpine

RUN apk add --no-cache icu-dev \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl

RUN docker-php-ext-install bcmath

RUN apk add --no-cache php7-pecl-memcached
