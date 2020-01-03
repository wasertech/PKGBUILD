# Maintainer: David Phillips <dbphillipsnz gmail>

_pkgname=farbfeld
pkgname=${_pkgname}-git
pkgver=4.r0.gab5e3df
pkgver() {
	cd "${_pkgname}"
	 git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="lossless image format which is easy to parse, pipe and compress"
url="https://tools.suckless.org/farbfeld/"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$_pkgname::git+https://git.suckless.org/${_pkgname}")
sha512sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	patch -Np1 -i ../pdf-size.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

source+=('pdf-size.patch')
sha512sums+=('030f7e44b777036c82d86f25c6b45f6fe381af4ae98c6aa7e85487ce09f865168ab0a05a87f03e4c16a0842eaf7993f450857436313d68ae1130a582b60d1fac')
