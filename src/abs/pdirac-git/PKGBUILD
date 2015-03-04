# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=pdirac-git
pkgver=v0.1.r6.g86337e1
pkgrel=1
pkgdesc="Filter to apply Dirac time/pitch stretching from stdin to stdout"
arch=('i686' 'x86_64')
url="https://github.com/djpohly/pdirac"
license=('GPL')
makedepends=('git' 'dirac-le')
provides=('pdirac')
conflicts=('pdirac')
source=("$pkgname::git+https://github.com/djpohly/pdirac.git")
md5sums=(SKIP)

pkgver() (
  cd "$srcdir/$pkgname"
  set -o pipefail
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
)

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
