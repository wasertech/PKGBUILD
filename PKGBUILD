# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=s6-portable-utils-musl
_pkgname=s6-portable-utils
pkgver=2.2.1.3
pkgrel=1
pkgdesc="Tiny portable generic utilities"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-portable-utils"
license=('custom:ISC')
makedepends=('skalibs>=2.8.0.0' 'musl')
provides=("$_pkgname=$pkgver")
source=(${url}/${_pkgname}-$pkgver.tar.gz)
sha256sums=('62ef131cccaaac76f47807f1684071012cf465a63fc744e5b9e179aa83b672c5')

build() {
  cd $srcdir/$_pkgname-$pkgver
  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --enable-static-libc --prefix=/usr \
              --datadir=/etc

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
