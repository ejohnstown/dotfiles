#!/bin/bash

DOTFILES="$PWD"

link_file() {
    TARGET="$HOME/.$(basename "$1")"
    if test -e "$TARGET"
    then
        echo "~${TARGET#$HOME} already exists, skipping"
    else
        echo "Creating link for $TARGET"
        ln -s "$DOTFILES/$1" "$TARGET"
    fi

}

install_vim() {
    link_file "vim/vimrc"
    link_file "vim/vim"
}

install_git() {
    link_file "git/gitconfig"
    link_file "git/git_template"
}

install_tmux() {
    link_file "tmux/tmux.conf"
}


if test ! -e "$HOME/.dotfiles"
then
    echo "Creating link for dotfiles at $HOME/.dotfiles"
    ln -s "$DOTFILES" "$HOME/.dotfiles"
fi

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
