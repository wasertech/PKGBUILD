# $Id: PKGBUILD 45448 2009-07-11 18:23:55Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=siis-ca-cert
pkgver=0.1
pkgrel=1
pkgdesc='SIIS CA certificate'
arch=('i686' 'x86_64')
url='http://siis.cse.psu.edu/ca.html'
license=('GPL')
source=("http://siis.cse.psu.edu/siis-ca-cert.pem"
	"http://siis.cse.psu.edu/siis-ca-cert.pem.asc")
depends=('ca-certificates')
install=siis-ca-cert.install
md5sums=('30bcc8233641d1861f1063f87b240782'
         'f77f76b457f09fb7628802121d10c640')

build() {
	cd ${srcdir}

	gpg --verify siis-ca-cert.pem.asc siis-ca-cert.pem || {
		echo "GPG verification failed.  Make sure you have imported Will's public key" 1>&2
		echo "using \`gpg --import'" 1>&2
		exit 1
	}

	install -D -m644 siis-ca-cert.pem $pkgdir/usr/share/ca-certificates/siis.cse.psu.edu/siis-ca.crt
}
