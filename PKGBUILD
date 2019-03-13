# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=execline-musl
_pkgname=execline
pkgver=2.5.1.0
pkgrel=2
pkgdesc="A (non-interactive) scripting language, like sh"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}/"
license=('ISC')
makedepends=('skalibs-musl>=2.8.0.0')
provides=("$_pkgname=$pkgver")
options=('staticlibs')
source=("http://skarnet.org/software/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b1a756842947488404db8173bbae179d6e78b6ef551ec683acca540ecaf22677')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  export CC="musl-gcc"
  ./configure --enable-static-libc --prefix=/usr --with-include=/usr/include

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ft=sh ts=2 sw=2 et:
