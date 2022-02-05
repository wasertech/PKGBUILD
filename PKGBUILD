# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname=dspdfviewer-git
_pkgname=${pkgname%-git}
pkgver=1.15.1.r161.g6550ab9
pkgrel=1
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'qt5-base' 'poppler-qt5')
makedepends=('git' 'cmake' 'boost' 'qt5-tools')
provides=('dspdfviewer')
conflicts=('dspdfviewer')
source=("git+https://github.com/djpohly/${_pkgname}#branch=custom")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
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
  cd "${_pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

source+=('prefs.diff')
sha256sums+=('61948dc3955f66b9aaa9be5afd7c287f60f523b09bed20cc0dd3bafaed6ffb9a')

# vim:set ts=2 sw=2 et:
