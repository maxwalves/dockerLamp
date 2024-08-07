FROM php:8.2-apache

# Instala as dependências e extensões PHP necessárias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    libldap2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mysqli gd mbstring soap fileinfo zip ldap \
    && docker-php-ext-enable gd mbstring mysqli soap ldap

# Copia arquivos de configuração personalizados
COPY apache/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY php/php.ini /usr/local/etc/php/php.ini

# Habilita módulos do Apache
RUN a2enmod rewrite
