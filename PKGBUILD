# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: boyska <piuttosto@logorroici.org>
pkgname=libgfshare-git
_basename=libgfshare
pkgver=r86.8bc91dd
pkgrel=1
pkgdesc="Library and utilities for multi-way secret-sharing"
arch=( 'i686' 'x86_64' )
url="http://www.digital-scurf.org/software/$_basename"
provides=('libgfshare')
conflicts=('libgfshare')
license=('custom')
source=("git+https://github.com/djpohly/$_basename.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_basename"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_basename"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_basename"
  make -k check
}

package() {
  cd "$srcdir/$_basename"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
