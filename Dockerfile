FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    zip \
    git \
    sqlite3

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN useradd -m -G www-data laravel

RUN a2enmod rewrite

ENV APACHE_DOCUMENT_ROOT /app/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

USER laravel
COPY --chown=laravel:laravel . /app

WORKDIR /app

RUN cp .env.example .env && \
    composer install && \
    php artisan key: && \
    touch /app/database/database.sqlite && \
    php artisan migrate && \
    php artisan optimize
