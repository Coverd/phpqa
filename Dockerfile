FROM jakzal/phpqa:php8.0

RUN apt-get update \
#&& apt-get install -y --no-install-recommends icu-dev autoconf build-base libmemcached-dev php8-pecl-memcached openssh rabbitmq-c-dev php8-pecl-amqp \
&& apt-get install -y --no-install-recommends apt-utils autoconf g++ gcc libmemcached-dev librabbitmq-dev pkg-config \
&& rm -rf /var/lib/apt/lists/* \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl

RUN docker-php-ext-install bcmath \
&& docker-php-ext-install sockets

RUN pecl install memcached \
&& docker-php-ext-enable memcached

#RUN pecl install amqp \
#&& docker-php-ext-enable amqp

RUN pecl install apcu \
&& docker-php-ext-enable apcu

RUN pecl install redis \
&& docker-php-ext-enable redis
