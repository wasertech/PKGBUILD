# Maintainer: Serge Bakharev <serge.bakharev@gmail.com>

pkgname=openconnect-palo-git
_pkgname=openconnect
pkgver=7.08.r169.gc62a909a
pkgrel=2
pkgdesc="VPN client for Palo Alto GlobalProtect VPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.infradead.org/openconnect.html"
depends=('libxml2' 'gnutls' 'libproxy' 'vpnc' 'krb5' 'lz4' 'trousers' 'stoken'
		'oath-toolkit')
makedepends=('intltool' 'python2' 'git')
options=('!emptydirs')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/dlenski/$_pkgname.git/")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's,^[^0-9]*,,;s,\([^-]*-g\),r\1,;s,-,.,g'
}

build() {
  cd $pkgname
  ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
      --sbindir=/usr/bin \
      --without-libpcsclite \
      --disable-static
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
