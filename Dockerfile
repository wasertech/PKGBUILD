FROM archimg/base-devel

# Update packages.
RUN pacman -Syu --noconfirm

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
RUN mkdir src bin

# Travis environment variables.
ENV TRAVIS_REPO_SLUG ${TRAVIS_REPO_SLUG}
ENV TRAVIS_BUILD_ID ${TRAVIS_BUILD_ID}
