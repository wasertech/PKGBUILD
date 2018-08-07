FROM archimg/base-devel

# Update packages.
RUN pacman -Syu --noconfirm git

# Clear cache.
RUN pacman -Scc --noconfirm

# Create an unprivileged user.
RUN useradd -m -G wheel -s /bin/bash pkguser

# Grant group wheel sudo rights without password.
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

# Set user.
USER pkguser

# Set working dir.
WORKDIR /home/pkguser

# Create dirs.
COPY --chown=pkguser . src
WORKDIR /home/pkguser/src
RUN mkdir aur repo
