FROM jakzal/phpqa:php8.0-alpine

RUN apk add --no-cache icu-dev \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl

RUN docker-php-ext-install bcmath \
&& docker-php-ext-install sockets

RUN apk add --no-cache autoconf build-base libmemcached-dev php8-pecl-memcached openssh \
&& pecl install memcached \
&& docker-php-ext-enable memcached

RUN apk add --no-cache rabbitmq-c-dev php8-pecl-amqp \
&& pecl install amqp \
&& docker-php-ext-enable amqp

RUN pecl install apcu \
&& docker-php-ext-enable apcu

RUN pecl install redis \
&& docker-php-ext-enable redis
