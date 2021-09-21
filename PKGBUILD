# Maintainer: Devin J. Pohly <djpohly@gmail.com>
pkgname=(dwm-git dwm-laptop-git)
_pkgname=dwm
pkgver=1689.142
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
install=dwm.install
provides=('dwm')
conflicts=('dwm')
source=(dwm.desktop
        "$_pkgname::git+https://github.com/djpohly/dwm.git#branch=myprefs"
        "$_pkgname-laptop::git+https://github.com/djpohly/dwm.git#branch=laptopprefs")
_upstream="git://git.suckless.org/dwm"
md5sums=('939f403a71b6e85261d09fc3412269ee'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname-laptop"

  git fetch -q "$_upstream" master

  local upstream=$(git rev-list --count FETCH_HEAD)
  local behind=$(git rev-list --count ..FETCH_HEAD)
  local ahead=$(git rev-list --count FETCH_HEAD..)

  [[ $behind -gt 0 ]] && error "Patched version is %s commits behind upstream" "$behind"

  printf "%s.%s\n" "$upstream" "$ahead"
}

build() {
  for d in "$_pkgname"{,-laptop}; do
    make -C "$d" X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
  done
}

package_dwm-git() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D ../dwm.desktop "$pkgdir/usr/share/xsessions/dwm.desktop"
}

package_dwm-laptop-git() {
  cd "$_pkgname-laptop"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D ../dwm.desktop "$pkgdir/usr/share/xsessions/dwm.desktop"
}

# vim:set ts=2 sw=2 et:
