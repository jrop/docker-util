FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  apt-add-repository -y ppa:fish-shell/release-3 && \
  apt-add-repository -y ppa:neovim-ppa/stable

RUN apt-get update && \
  apt-get install -y curl fish git jq net-tools neovim nodejs npm python-neovim telnet tmux yadm

RUN npm install -g prettier neovim yarn && \
  npm cache clean --force && \
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
  ~/.fzf/install

COPY dotfiles/ /root/
RUN fish -c "env TMUX=no echo"
RUN chsh -s /usr/bin/fish

ENV EDITOR=nvim
ENV TERM=xterm-256color
