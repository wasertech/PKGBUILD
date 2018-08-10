# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=compton-djp-git
_gitname=compton
pkgver=415.9
pkgrel=1
pkgdesc="X Compositor (a fork of xcompmgr-dana) (git-version)"
arch=(i686 x86_64)
url="https://github.com/chjj/compton"
license=('MIT')
depends=('libgl' 'libdbus' 'libxcomposite' 'libxdamage' 'libxrandr' 'pcre' 'libconfig' 'libxinerama')
makedepends=('git' 'asciidoc' 'mesa')
optdepends=('dbus:          To control compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans')
provides=('compton')
conflicts=('compton')
source=("git+https://github.com/djpohly/compton.git#branch=animation")
_upstream="https://github.com/chjj/compton.git"
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_gitname"

    git fetch "$_upstream" master

    local upstream=$(git rev-list --count FETCH_HEAD)
    local behind=$(git rev-list --count ..FETCH_HEAD)
    local ahead=$(git rev-list --count FETCH_HEAD..)

    [[ $behind -gt 0 ]] && warning "Patched version is %s commits behind upstream" "$behind"

    printf "%s.%s\n" "$upstream" "$ahead"
}

build() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr
  make docs
}

package() {
  cd "$srcdir/$_gitname"

  make PREFIX="$pkgdir/usr" install

  # install license
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"

  # example conf
  install -D -m644 "compton.sample.conf" "$pkgdir/etc/xdg/compton.conf.example"
}
