FROM ubuntu:latest

# Установка необходимых пакетов
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        curl \
        file \
        git \
        python3 \
        sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Установка Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Добавляем Homebrew в PATH
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

# Установка Neovim, Node.js, npm, Python 3, Lazygit, Ripgrep, GCC, Composer
RUN brew install neovim node npm python3 lazygit ripgrep gcc composer

# Копируем конфигурацию Neovim
COPY ./nvim /root/.config/nvim
RUN rm -rf /root/.local/share/nvim


# Запускаем установку плагинов Neovim
RUN nvim +Lazy +MasonInstallAll +qa
RUN rm -rf /root/.local/share/nvim/lazy/nvim-treesitter
RUN git clone  https://github.com/nvim-treesitter/nvim-treesitter.git  /root/.local/share/nvim/lazy/nvim-treesitter
RUN nvim -v

RUN nvim -c 'TSInstall! vim lua vimdoc html css scss typescript javascript php' -c 'qa'


# Настройка рабочей директории
WORKDIR /app

