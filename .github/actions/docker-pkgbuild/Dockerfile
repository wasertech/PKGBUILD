FROM archlinux:base-devel

# Update packages.
RUN pacman -Syu --noconfirm --ignore linux --ignore linux-firmware --needed base-devel

# Ensure wheel group exists (seriously??)
RUN groupadd -f -r wheel

# Create an unprivileged user.
RUN useradd -m -G wheel -s /bin/bash pkguser

# Grant group wheel sudo rights without password.
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

COPY pkgbuild.sh /entrypoint.sh

RUN ls -l /entrypoint.sh

RUN chown pkguser: /entrypoint.sh

RUN ls -l /entrypoint.sh

# Set user.
USER pkguser

ENTRYPOINT ["/entrypoint.sh"]
