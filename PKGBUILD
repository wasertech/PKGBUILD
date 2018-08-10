# $Id: PKGBUILD 59263 2009-11-21 18:19:33Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Leslie P. Polzer <leslie.polzer@gmx.net>
pkgname=xcompmgr-mod
pkgver=1.1.6
pkgrel=1
pkgdesc="Composite Window-effects manager for X.org"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'libxext')
conflicts=('xapps' 'xcompmgr')
provides=('xcompmgr')
replaces=('xapps')
source=("http://xorg.freedesktop.org/releases/individual/app/xcompmgr-$pkgver.tar.bz2"
        trim.patch)
sha1sums=('a9cf78ea32bac51ff584115381f195566b164fe3'
          '434fba3452d2373b85f5d0af8d4c78a8d1fa612a')

prepare() {
  cd "$srcdir/xcompmgr-$pkgver"
  patch -Np1 -i "$srcdir/trim.patch"
}

build() {
  cd "$srcdir/xcompmgr-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/xcompmgr-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/xcompmgr/COPYING"
}
