FROM archimg/base-devel
ARG userid

# Update packages.
RUN pacman -Syu --noconfirm git

# Clear cache.
RUN pacman -Scc --noconfirm

# Create an unprivileged user.
RUN useradd -m -u ${userid} -G wheel -s /bin/bash pkguser

# Grant group wheel sudo rights without password.
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

# Set user.
USER pkguser

# Set working dir.
WORKDIR /home/pkguser

RUN ls -ld
RUN ls -l

# Create dirs.
COPY . src
WORKDIR /home/pkguser/src
RUN ls -ld
RUN ls -l
