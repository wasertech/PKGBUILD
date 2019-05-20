pkgname=torrentcheck
pkgver=1.00
pkgrel=5
pkgdesc="Command line torrent viewer and hash checker"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/torrentcheck/"
license=('Public Domain')
depends=()
makedepends=(unzip)

source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.zip")
md5sums=('ba12ae767888837fe3e70fb025d554c2')

prepare() {
  unzip -d "$pkgname-$pkgver" "$pkgname-$pkgver.zip"
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../stderr.patch
}

build() {
  cd "$pkgname-$pkgver"
  gcc -O torrentcheck.c sha1.c -o torrentcheck
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 torrentcheck "$pkgdir/usr/bin/"
}

source+=(stderr.patch)
md5sums+=('1b5e5d8c82339dc4dd8e5e7ecee167da')

# vim:set ts=2 sw=2 et:
