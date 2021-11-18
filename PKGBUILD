# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>
# Contributor: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=hamlib-git
pkgver=b2acf0b6
pkgrel=1
pkgdesc="Ham radio equipment control libraries"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('tcl' 'python' 'libxml2' 'libusb')
makedepends=('autoconf' 'automake' 'libtool' 'swig' 'git')
source=('hamlib-git::git+git://git.code.sf.net/p/hamlib/code')
options=('!emptydirs')
conflicts=('hamlib')
provides=('hamlib')
md5sums=('SKIP')
sha256sums=('SKIP')


pkgver() {
	cd $srcdir/$pkgname
	git describe --always
# | sed 's|-|.|g'	# <- this might be needed in the future.
}

build() {
	export PYTHON=/usr/bin/python3

	cd $srcdir/$pkgname
#	./autogen.sh \
	autoreconf -i
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl-binding \
		--with-python-binding \
		--with-xml-support \
		--with-tcl-binding
	make
}

package() {
	cd $srcdir/$pkgname

	make DESTDIR=$pkgdir install

	# fix perl module location
#	cd $pkgdir/usr/lib/perl5/site_perl/
	eval $(perl -V:sitearch)
	cd $pkgdir$sitearch
	mkdir -p current/
	mv auto current
	mv Hamlib.pm current
	rm perltest.pl

	/usr/bin/find $pkgdir -name '.packlist' -delete
	/usr/bin/find $pkgdir -name '*.pod' -delete
}
