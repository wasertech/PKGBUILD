# $Id: PKGBUILD 11022 2010-02-05 00:21:28Z dgriffiths $
# Contributor: Xilon <xilonmu@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=dina-font-latin1
pkgver=2.89
pkgrel=6
pkgdesc='A monospace bitmap font, primarily aimed at programmers.'
arch=('any')
url="http://www.donationcoder.com/Software/Jibz/Dina/index.html"
license=('custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
makedepends=('pcf2bdf')
provides=('dina-font')
conflicts=('dina-font')
install=${pkgname}.install
source=(http://omploader.org/vMjIwNA/dina-pcf-2.89.tar.gz
        LICENSE)
md5sums=('d6c425c007a9a576b4bb88c88cf57076'
         'd7f8fbff7893c52e94b29c30369f2037')

build() {
  cd "$srcdir/Dina-PCF"
  for f in *.pcf; do
    pcf2bdf "$f" | sed 's/microsoft-cp1252/iso8859-1/' | bdftopcf -o "${f%.pcf}-latin1.pcf"
  done
}

package() {
  cd "$srcdir/Dina-PCF"
  for i in *-latin1.pcf; do
    install -Dm 644 $i ${pkgdir}/usr/share/fonts/local/${i/-latin1/}
  done
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
