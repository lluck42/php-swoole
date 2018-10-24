FROM registry.cn-hangzhou.aliyuncs.com/lluck42/php-fpm:latest

RUN mkdir -p ~/build && \
    cd ~/build && \
    rm -rf ./swoole-src && \
    curl -o swoole.tar.gz https://github.com/swoole/swoole-src/archive/v4.2.3.tar.gz -L && \
    tar zxvf swoole.tar.gz && \
    mv swoole-src* swoole-src && \
    cd swoole-src && \
    phpize && \
    ./configure && \
    make clean && make && make install && \
    echo extension=swoole.so > /usr/local/etc/php/conf.d/swoole.ini 

CMD php ${SCRIPTFILE}