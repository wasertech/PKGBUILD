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
source=(config.h attachabove.diff warp.diff restart.diff abs-mon.diff push.c nobar.diff autofocus.diff spawn-stdout.diff)
md5sums=('3fcf56f13b27c267f6c7177dd7a4a831'
         'fc8f44ea8ff83ca8745277a2501c55f1'
         '46e62c0979acf19ad41c30d1814f0f9b'
         '0f9db2c77bdf4023661e6e42d5e25a5b'
         '2c0b81d25742a010799d5bce27c66408'
         '689534c579b1782440ddcaf71537d8fd'
         'cf168ef9a096c6e462f94a9227cf22be'
         'e64b3233f351d6e8a9b1cf0dce83cb49'
         '45196c5e80feaac59ce40cc56a3fcb6f')

_hgroot='http://code.suckless.org/hg'
_hgrepo='dwm'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cp ../config.h .
  cp ../push.c .
  patch -Np1 < ../autofocus.diff
  patch -Np1 < ../attachabove.diff
  patch -Np1 < ../abs-mon.diff
  patch -Np1 < ../restart.diff
  patch -Np1 < ../warp.diff
  patch -Np1 < ../spawn-stdout.diff
  patch -Np1 < ../nobar.diff

  # add correct settings to config.mk
  sed -i "s|^PREFIX =.*|PREFIX = /usr|" config.mk
  sed -i "s|^X11INC =.*|X11INC = /usr/include/X11|" config.mk
  sed -i "s|^X11LIB =.*|X11LIB = /usr/lib/X11|" config.mk

  msg "Starting build process."
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make PREFIX="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/licenses/dwm"
  cp LICENSE "$pkgdir/usr/share/licenses/dwm"
}
# vim:set ts=2 sw=2 et:
