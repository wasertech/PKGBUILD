# $Id: PKGBUILD 45448 2009-07-11 18:23:55Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=siis-ca-cert
pkgver=0.3
pkgrel=6
pkgdesc='SIIS CA certificate'
arch=('any')
url='http://siis.cse.psu.edu/ca.html'
license=('GPL')
source=("http://siis.cse.psu.edu/siis-ca-cert.pem"
	"http://siis.cse.psu.edu/siis-ca-cert.pem.sig")
depends=('ca-certificates')
makedepends=('gnupg')
md5sums=('478845645d748fbbc5795d291556dd4a'
         '2355767d9b8d0b9df02afb8ee137e59f')
validpgpkeys=('B2D4A6EAA484AC0182702F535942FD99C61C0B8C')

build() {
	cd ${srcdir}

	if ! gpg --verify siis-ca-cert.pem.sig siis-ca-cert.pem; then
		echo "GPG verification failed.  Make sure you have Steve's public key" 1>&2
		echo "in your trust database." 1>&2
		exit 1
	fi
}

package() {
	install -D -m644 "$srcdir/siis-ca-cert.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/siis-ca.crt"
}
