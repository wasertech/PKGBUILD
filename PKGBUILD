# $Id: PKGBUILD 17291 2010-05-22 18:01:10Z cbrannon $
# Maintainer: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>

pkgname=dtach-mod
pkgver=0.8
pkgrel=6
pkgdesc="emulates the detach feature of screen"
arch=('i686' 'x86_64')
url="http://dtach.sourceforge.net/"
provides=(dtach)
conflicts=(dtach)
license=('GPL')
depends=('ncurses')
source=(http://downloads.sourceforge.net/sourceforge/dtach/dtach-$pkgver.tar.gz
        no-output.diff
        parser.patch)
md5sums=('ec5999f3b6bb67da19754fcb2e5221f3'
         'c3415f07c985d7fcdeab14a8065e398e'
         '5f26eaa56a3466871668a8f0706e9fab')

build() {
  cd "${srcdir}/dtach-${pkgver}"

  patch -Np1 < ../no-output.diff
  patch -Np1 < ../parser.patch
  autoheader
  autoconf

  ./configure --prefix=/usr --enable-parser
  make || return 1
}

package() {
  cd "${srcdir}/dtach-${pkgver}"
  install -Dm755 dtach "${pkgdir}/usr/bin/dtach"
  install -Dm644 dtach.1 "${pkgdir}/usr/share/man/man1/dtach.1"
}

# vim:set ts=2 sw=2 et:
