FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR ~/
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y git
RUN apt-get install -y php 
RUN apt-get install -y php-mbstring php-curl php-zip
RUN apt-get install wget
RUN apt-get install -y gnupg2

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer
RUN git clone https://github.com/mundipagg/ecommerce-test-package.git


RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install -y google-chrome-unstable

RUN cd ecommerce-test-package && composer install
CMD google-chrome-unstable --disable-gpu --no-sandbox --headless --remote-debugging-#address=127.0.0.1 --remote-debugging-port=9222 --disable-extensions 
EXPOSE 9222

