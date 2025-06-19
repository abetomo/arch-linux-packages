#!/bin/bash

set -eux

# Build
git clone --depth=1 https://aur.archlinux.org/groonga.git
cd groonga
makepkg \
  --needed \
  --noconfirm \
  --rmdeps \
  --skippgpcheck \
  --syncdeps

sudo cp ./*.pkg.tar.* /host
