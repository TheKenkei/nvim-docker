FROM alpine:latest

# Установка необходимых пакетов
RUN apk update && apk upgrade

RUN apk add --no-cache \
    build-base \
    curl \
    file \
    git \
    python3 \
    sudo \
    bash \
    neovim \
    nodejs \
    npm \
    lazygit \
    ripgrep \
    gcc \
    neovim \ 
    composer \
    bash \
   php83 \
php83-cli \
php83-phar \
php83-openssl \
php83-json \
php83-opcache \
php83-xml \
php83-dom \
php83-xmlreader \
php83-ctype \
php83-session \
php83-mbstring \
php83-tokenizer \
php83-zip \
php83-curl \
php83-iconv \
php83-pdo \
php83-pdo_mysql \
php83-pdo_pgsql \
php83-pdo_sqlite \
php83-bz2 \
php83-xsl \
php83-gd \
php83-fileinfo \
php83-intl \
php83-ldap \
php83-simplexml \
php83-sqlite3 \
php83-bcmath \
php83-posix \
php83-sodium \
php83-xmlwriter \ 
curl \ 
    && rm -rf /var/cache/apk/*
#


RUN rm -rf /usr/bin/php; 





RUN ln -s /usr/bin/php83 /usr/bin/php

RUN echo php -v 

# Устанавливаем Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Устанавливаем Symfony CLI (по желанию)
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony*/bin/symfony /usr/local/bin/symfony

# Копируем конфигурацию Neovim
COPY ./nvim /root/.config/nvim
COPY ./lazygit /root/.config/lazygit

# Запускаем установку плагинов Neovim
RUN nvim +Lazy +MasonInstallAll +qa
RUN rm -rf /root/.local/share/nvim/lazy/nvim-treesitter
RUN git clone https://github.com/nvim-treesitter/nvim-treesitter.git /root/.local/share/nvim/lazy/nvim-treesitter

RUN nvim -v

RUN nvim -c 'TSInstall! vim lua vimdoc html dockerfile tsx  css scss typescript javascript php' -c 'qa'

# Настройка рабочей директории
WORKDIR /app

