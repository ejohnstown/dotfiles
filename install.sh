#!/bin/bash

install_vimrc() {
    echo "installing vimrc"
}

install_vimplugins() {
    echo "installing vim plugins"
}

install_git() {
    echo "installing gitrc"
}

install_tmux() {
    echo "installing tmuxrc"
}

case "$1" in
    vim)
        install_vimrc
        install_vimplugins
        ;;
    git)
        install_git
        ;;
    tmux)
        install_tmux
        ;;
    all)
        install_vimrc
        install_vimplugins
        install_git
        install_tmux
        ;;
    *)
      echo "Usage: $(basename "$0") {vim|git|tmux|all}"
      ;;
esac
