# Maintainer: Devin J. Pohly <djpohly@gmail.com>
pkgname=dtach-djp-git
pkgver=0.8.30.g8056b47
pkgrel=1
pkgdesc="Emulates the detach feature of screen (dj devin rmx)"
arch=(i686 x86_64)
url="http://dtach.sourceforge.net/"
license=('GPL')
depends=('ncurses')
makedepends=('git')
provides=('dtach')
conflicts=('dtach')
source=("git+https://github.com/djpohly/dtach")
md5sums=(SKIP)
_gitname=dtach

pkgver() {
  cd "$srcdir/$_gitname"

  git describe --always --tags | tr - .
}

build() {
  cd "$srcdir/$_gitname"

  autoreconf -i
  ./configure --prefix=/usr --enable-parser
  make
}

package() {
  cd "$srcdir/$_gitname"

  install -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" dtach dtmaster dtattach
  install -Dm644 dtach.1 "$pkgdir/usr/share/man/man1/dtach.1"
}

# vim:set ts=2 sw=2 et:
