# $Id: PKGBUILD 45448 2009-07-11 18:23:55Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=siis-ca-cert
pkgver=0.2
pkgrel=1
pkgdesc='SIIS CA certificate'
arch=('any')
url='http://siis.cse.psu.edu/ca.html'
license=('GPL')
source=("http://siis.cse.psu.edu/siis-ca-cert.pem"
	"http://siis.cse.psu.edu/siis-ca-cert.pem.sig")
depends=('ca-certificates')
makedepends=('gnupg')
install=siis-ca-cert.install
md5sums=('5375bd32740dbed5ea182a0b6d0e988e'
         '47db708a3c0827b4915d0313b437943b')

build() {
	cd ${srcdir}

	gpg --verify siis-ca-cert.pem.sig siis-ca-cert.pem || {
		echo "GPG verification failed.  Make sure you have Steve's public key" 1>&2
		echo "in your trust database." 1>&2
		exit 1
	}
}

package() {
	install -D -m644 "$srcdir/siis-ca-cert.pem" "$pkgdir/usr/share/ca-certificates/siis.cse.psu.edu/siis-ca.crt"
}
