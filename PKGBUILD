# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name=stag-graph
pkgname="${_name}-git"
pkgdesc='streaming bar graphs, for stats and stuff'
arch=('i686' 'x86_64')
url='https://github.com/djpohly/stag'
pkgver=109.cab1821
pkgrel=1
depends=('ncurses')
makedepends=('git')
provides=('stag-graph')
conflicts=('stag-graph' 'stag-git')
source=("${_name}::git+${url}#branch=unicode")
sha256sums=('SKIP')

pkgver () {
    cd "${srcdir}/${_name}"
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "${srcdir}/${_name}"
    make
}

package () {
    cd "${srcdir}/${_name}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
