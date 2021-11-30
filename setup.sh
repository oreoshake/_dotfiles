#!/bin/zsh

export CI=1


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


case `uname` in
  Darwin)
    CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval $(/opt/homebrew/bin/brew shellenv)
    brew install rbenv
  ;;
  Linux)
    apt install rbenv
    rbenv install
  ;;
esac

git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth=1 https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
git clone --depth=1 https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

# TODO symlink these instead

cp .zshrc ~
cp -R .rbenv ~
cp -R .gemrc ~
cp -R .gitconfig ~
