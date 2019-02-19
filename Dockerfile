FROM ubuntu:18.10

RUN apt-get update && \
  apt-get install -y curl git neovim nodejs npm tmux && \
  apt-get clean all
RUN npm install -g yarn prettier && npm cache clean --force
COPY dotfiles/files/init.vim /root/.config/nvim/init.vim
COPY dotfiles/files/tmux.conf /root/.tmux.conf
ENV EDITOR=nvim
