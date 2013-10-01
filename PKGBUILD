# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=kbd-dvorak-djp
pkgver=0.1
pkgrel=1
pkgdesc="Custom Dvorak keyboard layout"
arch=(any)
license=('GPL')
source=(dvorak-djp.map)
sha1sums=('b32a04ef529210e29bf25630d05fe47a2c097044')

package() {
	cd "$srcdir"
	install -Dm644 dvorak-djp.map "$pkgdir/usr/share/kbd/keymaps/i386/dvorak/dvorak-djp.map"
	gzip "$pkgdir/usr/share/kbd/keymaps/i386/dvorak/dvorak-djp.map"
}
