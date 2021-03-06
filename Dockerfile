FROM wordpress:5.0.3-php7.3

RUN     if [ ! -f /usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so ]; then \
    pecl install xdebug; \
    fi; \
    { \
    echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so'; \
    echo '[xdebug]'; \
    echo 'xdebug.remote_enable=1'; \
    echo 'xdebug.remote_autostart=1'; \
    echo 'xdebug.remote_host=host.docker.internal'; \
    echo 'xdebug.remote_port=9000'; \
    } > /usr/local/etc/php/conf.d/php-xdebug.ini ;
