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

# Those lines are not working as the latest AMQP release is not compatible with PHP8
#RUN pecl install amqp \
#&& docker-php-ext-enable amqp

# That's why we use the latest version available on master
# @See https://github.com/php-amqp/php-amqp/issues/386#issuecomment-778648945
RUN apt-get update \
&& apt-get install -y -f librabbitmq-dev libssh-dev \
&& docker-php-source extract \
&& mkdir /usr/src/php/ext/amqp \
&& curl -L https://github.com/php-amqp/php-amqp/archive/master.tar.gz | tar -xzC /usr/src/php/ext/amqp --strip-components=1 \
&& docker-php-ext-install amqp \
&& docker-php-ext-enable amqp

RUN pecl install apcu \
&& docker-php-ext-enable apcu

RUN pecl install redis \
&& docker-php-ext-enable redis

RUN composer global bin phpstan require jangregor/phpstan-prophecy
