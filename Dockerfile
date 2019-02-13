FROM archlinux/base
ARG userid

# Update packages.
RUN pacman -Syu --noconfirm --ignore linux --ignore linux-firmware base-devel

# Create an unprivileged user.
RUN useradd -m -u ${userid} -G wheel -s /bin/bash pkguser

# Grant group wheel sudo rights without password.
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

# Set user.
USER pkguser

# Set working dir.
WORKDIR /home/pkguser/src
