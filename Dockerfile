# Use an official PHP runtime as a parent image
FROM php:8.3.0-fpm

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
        unzip \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Make port 9000 available to the world outside this container
EXPOSE 9000

# Run php-fpm when the container launches
CMD ["php-fpm"]
