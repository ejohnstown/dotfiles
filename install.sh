#!/bin/bash

install_vim() {
    echo "installing vim"
    curl -LSso vim/vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

install_git() {
    echo "installing gitrc"
}

install_tmux() {
    echo "installing tmuxrc"
}

case "$1" in
    vim)
        install_vim
        ;;
    git)
        install_git
        ;;
    tmux)
        install_tmux
        ;;
    all)
        install_vim
        install_git
        install_tmux
        ;;
    *)
      echo "Usage: $(basename "$0") {vim|git|tmux|all}"
      ;;
esac
