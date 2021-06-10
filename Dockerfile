FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
  cron \
  curl \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  libzip-dev \
  libxslt1-dev \
  mariadb-client \
  zip \
  git

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  bcmath \
  dom \
  gd \
  intl \
  mbstring \
  opcache \
  pdo_mysql \
  soap \
  xsl \
  zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --version=1.10.22 --install-dir=/usr/local/bin/ --filename=composer
RUN composer global require hirak/prestissimo

# Install Mhsendmail
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install golang-go \
   && mkdir /opt/go \
   && export GOPATH=/opt/go \
   && go get github.com/mailhog/mhsendmail

# Install Magerun 2
RUN curl -O https://files.magerun.net/n98-magerun2.phar \
    && chmod +x ./n98-magerun2.phar \
    && mv ./n98-magerun2.phar /usr/local/bin/magerun

EXPOSE 9000
CMD ["php-fpm"]
