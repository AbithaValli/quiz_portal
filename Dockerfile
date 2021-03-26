# https://hub.docker.com/_/php
FROM php:7.4-apache


# Configure PHP for Cloud Run.
# Precompile PHP code with opcache.
#RUN docker-php-ext-install -j "$(nproc)" opcache

# Copy in custom code from the host machine.
#WORKDIR /var/www/html/quiz_portal
COPY . /var/www/html/quiz_portal

# Use the PORT environment variable in Apache configuration files.
# https://cloud.google.com/run/docs/reference/container-contract#port
#RUN sed -i 's/80/$PORT/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Configure PHP for development.
ENV PORT 8080
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# https://github.com/docker-library/docs/blob/master/php/README.md#configuration
#RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
