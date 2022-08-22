# Maintainer: jjacky
_pkgname=anopa
pkgname=$_pkgname-musl
pkgver=0.5.0
pkgrel=1
pkgdesc="init system/service manager built around s6 supervision suite [musl]"
arch=('i686' 'x86_64')
url="https://jjacky.com/anopa"
license=('GPL3+')
depends=('execline-musl' 's6-musl')
makedepends=('musl' 'skalibs-musl')
options=('staticlibs')
source=(https://jjacky.com/$_pkgname/$_pkgname-$pkgver.tar.xz skalibs-s6-update.diff)
sha256sums=('a9f3f7024220c665e11853cde6371907d92752b73bf3524ef1f3746b51705d89'
            'bfeee0f6e8a634cc88309cacb8647cee5e405bb3eb7032b518e9fffd1dccd5ad')
provides=($_pkgname)
conflicts=($_pkgname)

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/skalibs-s6-update.diff"
}

build() {
  cd "$_pkgname-$pkgver"

  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --enable-static-libc --bindir=/usr/bin --libexecdir=/usr/lib/anopa
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
