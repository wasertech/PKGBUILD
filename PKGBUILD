# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=s6-musl
_pkgname=s6
pkgver=2.8.0.0
pkgrel=1
pkgdesc='A small suite of programs for UNIX, designed to allow process supervision'
arch=('x86_64')
url="http://skarnet.org/software/${_pkgname}/"
license=('ISC')
makedepends=('skalibs-musl>=2.8.0.0')
depends=('execline>=2.5.1.0')
provides=("$_pkgname=$pkgver")
options=('staticlibs')
source=("http://skarnet.org/software/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('284792d8bebecc2c0c1f8318149dac9e6d52fe7756d5de55b4bb47a84ba7b106')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --enable-static-libc --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
