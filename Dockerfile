FROM jakzal/phpqa:php7.4-alpine

RUN docker-php-ext-install intl
RUN docker-php-ext-install memcached
RUN docker-php-ext-install bcmath
