pkgname=('alacritty-git' 'alacritty-terminfo-git')
_pkgname="alacritty"
pkgver=0.1.0.569.g4e9b1c5
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/jwilm/alacritty"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'git' 'ncurses')
source=("$_pkgname::git+https://github.com/jwilm/alacritty.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)"
}

package_alacritty-git() {
	pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
	depends=('freetype2' 'fontconfig' 'xclip')
	makedepends=('rust' 'cargo' 'cmake' 'git')
	provides=('alacritty')
	conflicts=('alacritty')

	cd $_pkgname

	env CARGO_INCREMENTAL=0 cargo build --release

	install -D -m755 "$srcdir/$_pkgname/target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "$srcdir/$_pkgname/Alacritty.desktop" "$pkgdir/usr/share/applications/Alacritty.desktop"
}

package_alacritty-terminfo-git() {
	pkgdesc="Terminfo files for the alacritty terminal emulator"
	makedepends=('ncurses')
	provides=('alacritty-terminfo')
	conflicts=('alacritty-terminfo')

	cd $_pkgname

	install -dm 755 "$pkgdir/usr/share/terminfo/a/"
	tic -o "$pkgdir/usr/share/terminfo" alacritty.info
}
