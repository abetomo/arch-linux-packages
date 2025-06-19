#!/bin/bash

set -eux

# Install dependencies
sudo pacman --sync --noconfirm --refresh --sysupgrade
sudo pacman --sync --noconfirm \
  autoconf \
  debugedit \
  fakeroot \
  gcc \
  git \
  make

# Install dependencies in AUR
dependencies=(
  mecab-git
  mecab-ipadic
)
for package in "${dependencies[@]}"; do
  git clone --depth=1 "https://aur.archlinux.org/${package}.git"
  pushd "${package}"
  makepkg \
    --install \
    --needed \
    --noconfirm \
    --rmdeps \
    --skipchecksums \
    --skippgpcheck \
    --syncdeps
  popd
  rm -rf "${package}"
done
