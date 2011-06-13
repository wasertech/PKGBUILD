# $Id: PKGBUILD 59263 2009-11-21 18:19:33Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Leslie P. Polzer <leslie.polzer@gmx.net>
pkgname=xcompmgr-mod
pkgver=1.1.5
pkgrel=1
pkgdesc="Composite Window-effects manager for X.org"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxcomposite' 'libxdamage' 'libxrender')
conflicts=('xapps' 'xcompmgr')
provides=('xcompmgr')
replaces=('xapps')
source=(http://xorg.freedesktop.org/releases/individual/app/xcompmgr-${pkgver}.tar.bz2
        trim.patch)
sha1sums=('9b4d7c3c64b3d980ea317b5206fee17adefd1d65'
          '5ffe06939f5f487d314a1193e5706e5d4bc28dff')

build() {
  cd "${srcdir}/xcompmgr-${pkgver}"
  patch -Np1 < ../trim.patch || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

package() {
  cd "${srcdir}/xcompmgr-${pkgver}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xcompmgr"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xcompmgr/" || return 1
}
