# $Id$
# Contributor: tobias [tobias [at] archlinux.org]
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt
pkgver=1.10.0
pkgrel=2
pkgdesc='Small but very powerful text-based mail client'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
source=("http://ftp.mutt.org/pub/mutt/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('0215b5f90ef9cc33441a6ca842379b64412ed7f8da83ed68bfaa319179f5535b'
            'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')

source+=(reply-filter.patch
	 smtp-samepass.patch)
sha256sums+=('a0d77346530ee5d7ab0a6005c205eb9577d4832e2f7d22e91ad4ebc06469c53a'
             'be33e45656a8fff366d855de996569ed25b7b7ab3a9b1cebe16243934a8cf277')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i "$srcdir/reply-filter.patch"
	patch -Np1 -i "$srcdir/smtp-samepass.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-gpgme \
		--enable-pop \
		--enable-imap \
		--enable-smtp \
		--enable-hcache \
		--enable-sidebar \
		--with-curses=/usr \
		--with-regex \
		--with-gss=/usr \
		--with-ssl=/usr \
		--with-sasl \
		--with-idn \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/etc/mime.types{,.dist}
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
