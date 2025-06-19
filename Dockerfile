FROM archlinux

RUN pacman --sync --noconfirm --refresh --sysupgrade && \
  pacman --sync --noconfirm sudo

RUN useradd -m builder && \
  echo "builder ALL=(ALL:ALL) NOPASSWD:ALL" | \
    EDITOR=tee visudo -f /etc/sudoers.d/groonga

USER builder
WORKDIR /build
