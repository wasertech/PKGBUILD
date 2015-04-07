# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=resonance-font
pkgver=0.1
pkgrel=2
pkgdesc="Tiny programming/console font"
arch=(any)
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(ReSonance-cp437.psf)
md5sums=('c4de6540bcf28da6bbe2ba0aadb3f8ef')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/kbd/consolefonts"
  gzip -c ReSonance-cp437.psf > "$pkgdir/usr/share/kbd/consolefonts/ReSonance.psf.gz"
}

# vim:set ts=2 sw=2 et:
