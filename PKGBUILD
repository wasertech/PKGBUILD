# Maintainer: Devin J. Pohly <djpohly@gmail.com>
pkgname=(dwm-git dwm-laptop-git)
pkgbase=dwm-git
pkgver=1677.92
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
install=
provides=('dwm')
conflicts=('dwm')
source=("git+https://github.com/djpohly/dwm.git#branch=laptopprefs" dwm.desktop)
_upstream="git://git.suckless.org/dwm"
md5sums=(SKIP '939f403a71b6e85261d09fc3412269ee')

prepare() {
  rm -rf "$srcdir/dwm-laptop"
  cp -a "$srcdir/dwm"{,-laptop}
  git -C "$srcdir/dwm" checkout myprefs

  for d in "$srcdir/dwm"{,-laptop}; do
    (cd "$d"
      sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
      sed -i 's/^CFLAGS = -g/#CFLAGS += -g/g' config.mk
      sed -i 's/^#CFLAGS = -std/CFLAGS += -std/g' config.mk
      sed -i 's/^LDFLAGS =/LDFLAGS +=/g' config.mk
      rm -f config.h
    )
  done
}

pkgver() {
  cd "$srcdir/dwm-laptop"

  git fetch -q "$_upstream" master

  local upstream=$(git rev-list --count FETCH_HEAD)
  local behind=$(git rev-list --count ..FETCH_HEAD)
  local ahead=$(git rev-list --count FETCH_HEAD..)

  [[ $behind -gt 0 ]] && error "Patched version is %s commits behind upstream" "$behind"

  printf "%s.%s\n" "$upstream" "$ahead"
}

build() {
  for d in "$srcdir/dwm"{,-laptop}; do
    make -C "$d" X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
  done
}

package_dwm-git() {
  cd "$srcdir/dwm"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

package_dwm-laptop-git() {
  cd "$srcdir/dwm-laptop"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

# vim:set ts=2 sw=2 et:
