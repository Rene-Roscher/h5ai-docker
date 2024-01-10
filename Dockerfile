# Use PHP 8.2 with FPM and Alpine for a lightweight base
FROM php:8.2-fpm-alpine

# Install nginx and dependencies
RUN apk add --no-cache nginx

# Download and install h5ai
RUN wget https://release.larsjung.de/h5ai/h5ai-0.30.0.zip -O /tmp/h5ai.zip \
    && unzip /tmp/h5ai.zip -d /var/www/html/_h5ai \
    && rm /tmp/h5ai.zip

# Copy the nginx configuration file into the container
COPY ./web/nginx.conf /etc/nginx/nginx.conf
COPY ./web/default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for web access
EXPOSE 80

# Start nginx and PHP-FPM
CMD ["nginx"]
