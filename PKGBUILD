# Maintainer: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=skalibs-musl
pkgver=2.12.0.1
pkgrel=1
pkgdesc="A set of general-purpose C programming libraries"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/skalibs"
license=('custom:ISC')
makedepends=(musl)
provides=(skalibs=2.10.0.0)
replaces=(skalibs)
conflicts=(skalibs)
options=('staticlibs')
changelog=CHANGELOG
source=(${url}/skalibs-$pkgver.tar.gz)
sha256sums=('3e228f72f18d88c17f6c4e0a66881d6d3779427b7e7e889f3142b6f26da30285')

build() {
  cd "$srcdir/skalibs-$pkgver"

  CC="musl-gcc" ./configure --disable-shared
  make
}

package() {
  cd "$srcdir/skalibs-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
