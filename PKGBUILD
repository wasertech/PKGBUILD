# $Id: PKGBUILD 17291 2010-05-22 18:01:10Z cbrannon $
# Maintainer: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>

pkgname=dtach-mod
pkgver=0.8
pkgrel=5
pkgdesc="emulates the detach feature of screen"
arch=('i686' 'x86_64')
url="http://dtach.sourceforge.net/"
provides=(dtach)
conflicts=(dtach)
license=('GPL')
depends=('ncurses')
source=(http://downloads.sourceforge.net/sourceforge/dtach/dtach-$pkgver.tar.gz
        parser.patch)
md5sums=('ec5999f3b6bb67da19754fcb2e5221f3'
         'dcf3093419200ef4e01c26a7cc55499e')

build() {
  cd "${srcdir}/dtach-${pkgver}"

  patch -Np1 < ../parser.patch || return 1
  autoheader
  autoconf

  ./configure --prefix=/usr --enable-parser || return 1
  make || return 1
}

package() {
  cd "${srcdir}/dtach-${pkgver}"
  install -Dm755 dtach "${pkgdir}/usr/bin/dtach" || return 1
  install -Dm644 dtach.1 "${pkgdir}/usr/share/man/man1/dtach.1" || return 1
}

# vim:set ts=2 sw=2 et:
