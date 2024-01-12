FROM php:8.2-alpine

# Install zip and unzip php scripts
RUN apt-get update && apt-get install -y zip unzip && apt-get install -y libzip-dev && docker-php-ext-install zip

# Install necessary PHP extensions and other dependencies
RUN docker-php-ext-install pdo_mysql mysqli

# Install php webp support plugin
RUN apt-get install -y libwebp-dev && docker-php-ext-configure gd --with-webp && docker-php-ext-install gd

#Download Node.js 20.x setup script, bypass the deprecated warniong wait and install
RUN curl -fsSL -o /tmp/setup_nodejs.sh https://deb.nodesource.com/setup_20.x && sed -i '/sleep/d' /tmp/setup_nodejs.sh && bash - && apt-get install -y nodejs npm

# Copy directory
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# Change ownership of the directory to www-data user and group
RUN chown -R www-data:www-data /var/www/html
