# $Id: PKGBUILD 143986 2011-12-01 15:13:39Z giovanni $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace-nano
pkgver=4.6
pkgrel=2
pkgdesc="A useful diagnostic, instructional, and debugging tool"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/strace/"
license=('custom')
depends=('perl')
provides=('strace')
conflicts=('strace')
source=("http://downloads.sourceforge.net/strace/strace-$pkgver.tar.xz" nanoseconds.patch)
md5sums=('c575ef43829586801f514fd91bfe7575'
         '062fe6024e74da2fbfb2504e84b4e78c')

build() {
  cd "$srcdir/strace-$pkgver"

  patch -Np1 -i "$srcdir/nanoseconds.patch"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/strace-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/strace/LICENSE"
}
