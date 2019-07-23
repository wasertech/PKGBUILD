# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=indent
pkgver=2.2.12
pkgrel=1
pkgdesc="C language source code formatting program"
arch=('x86_64')
url="https://www.gnu.org/software/indent/"
license=('GPL3')
depends=('glibc')
makedepends=('texi2html')
source=("https://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.gnu.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha1sums=('eecb3d7e78516d846af70e7bc86aabac9b92399c')

prepare() {
  cd ${pkgname}-${pkgver}
  # Add -bss and -nbss
  patch -Np1 -i ../indent-2.2.12-bss.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" docdir=/usr/share/doc/indent install
}

source+=(indent-2.2.12-bss.patch)
sha1sums+=('9ca3f534cde9139240b234625123ccd21bd8973b')
