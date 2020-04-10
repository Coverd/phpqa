FROM jakzal/phpqa:php7.4-alpine

RUN apk add --no-cache icu-dev \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl

RUN docker-php-ext-install bcmath \
&& docker-php-ext-install sockets

RUN apk add --no-cache autoconf build-base libmemcached-dev php7-pecl-memcached \
&& pecl install memcached \
&& docker-php-ext-enable memcached

RUN apk add --no-cache rabbitmq-c-dev php7-pecl-amqp \
&& pecl install amqp \
&& docker-php-ext-enable amqp
