# Ecommerce test package
A e-commerce test suite for all Mundipagg e-commerce modules

## Modules

- [MundiPagg Magento 2 Module](https://github.com/mundipagg/magento2/)

## Depedencies

- PHP 7.0+
- [Composer](https://getcomposer.org/)
- [Behat 3.5](https://behat.org/en/latest/)
- Chrome unstable

## How to use

Run chrome unstable server

`google-chrome-unstable --no-sandbox --remote-debugging-address=127.0.0.1 --remote-debugging-port=9222`

Run behat selecting module's name

`vendor/bin/behat --profile magento2`


## Installing chrome unstable

`wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
              echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
              apt-get -y update && apt-get -y install google-chrome-unstable`
