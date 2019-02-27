FROM ubuntu:18.10

RUN apt-get update && \
  apt-get install -y ansible curl git jq net-tools neovim nodejs npm telnet tmux && \
  apt-get clean all

RUN npm install -g yarn prettier && npm cache clean --force

COPY dotfiles/ /root/dotfiles/
RUN cd /root/dotfiles && ansible-galaxy -r requirements.yml install
RUN cd /root/dotfiles && ansible-playbook --diff playbook.yml --skip-tags "bash-it,nvm,pkgs"

ENV EDITOR=nvim
ENV TERM=xterm-256color
