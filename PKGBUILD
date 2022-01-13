# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname="dspdfviewer"
pkgver=1.15.1
pkgrel=5
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'qt5-base' 'poppler-qt5')
makedepends=('cmake' 'boost' 'qt5-tools')
conflicts=('dspdfviewer-git')
source=("https://github.com/dannyedel/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c5b6f8c93d732e65a27810286d49a4b1c6f777d725e26a207b14f6b792307b03')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../prefs.diff
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr/" \
    -DCMAKE_FIND_PACKAGE_RESOLVE_SYMLINKS=ON \
    -DSYSCONFDIR="/etc" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBuildTests=OFF \
    -DCMAKE_CXX_FLAGS_INIT="-Wno-error=deprecated-declarations" \
    -DDSPDFVIEWER_VERSION="${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

source+=('prefs.diff')
sha256sums+=('61948dc3955f66b9aaa9be5afd7c287f60f523b09bed20cc0dd3bafaed6ffb9a')

# vim:set ts=2 sw=2 et:
