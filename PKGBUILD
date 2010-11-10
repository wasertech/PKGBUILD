# Contributer: v2punkt0 <v2punkt0@gmail.com>

pkgname='dwm-hg'
pkgver=1527
pkgrel=1
pkgdesc="The latest hg pull of dwm"
url="http://dwm.suckless.org"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11')
makedepends=('mercurial')
conflicts=('dwm')
provides=('dwm')
source=(config.h warp.diff restart.diff abs-mon.diff push.c)
md5sums=('16142d4ff0297d307b27fc2a15164847'
         '46e62c0979acf19ad41c30d1814f0f9b'
         '0f9db2c77bdf4023661e6e42d5e25a5b'
         '2c0b81d25742a010799d5bce27c66408'
         '689534c579b1782440ddcaf71537d8fd')

_hgroot='http://code.suckless.org/hg'
_hgrepo='dwm'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cp ../config.h .
  cp ../push.c .
  patch -Np1 < ../abs-mon.diff || return 1
  patch -Np1 < ../restart.diff || return 1
  patch -Np1 < ../warp.diff || return 1

  # add correct settings to config.mk
  sed -i "s|^PREFIX =.*|PREFIX = /usr|" config.mk
  sed -i "s|^X11INC =.*|X11INC = /usr/include/X11|" config.mk
  sed -i "s|^X11LIB =.*|X11LIB = /usr/lib/X11|" config.mk

  msg "Starting build process."
  make || return 1
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make PREFIX="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/licenses/dwm"
  cp LICENSE "$pkgdir/usr/share/licenses/dwm"
}
# vim:set ts=2 sw=2 et:
