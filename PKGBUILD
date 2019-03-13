# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=skalibs-musl
_pkgname=skalibs
pkgver=2.8.0.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('i686' 'x86_64')
makedepends=('musl')
provides=("$_pkgname=$pkgver")
options=('staticlibs')
source=(http://www.skarnet.org/software/skalibs/$_pkgname-$pkgver.tar.gz)
sha256sums=('a3c0ed99d75be1485e69f9566badbfff936a571bbcf92a32c76240890c8e1e1a')

build() {
  cd $srcdir/$_pkgname-$pkgver
  CC="musl-gcc" ./configure --disable-shared --prefix=/usr \
              --datadir=/etc

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
