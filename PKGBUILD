# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=djp-keyring
pkgver=0.1
pkgrel=4
pkgdesc="Personal PGP keyring"
arch=(any)
url="https://github.com/djpohly/PKGBUILD"
license=('GPL')
install="$pkgname.install"
source=('djp.gpg' 'djp-trusted')
sha256sums=('33fe6221992532d7c387f064162b2103a5c9d8ca3ae2a78d378c1c833ffdf080'
            '738903eb70dfe4bb281778cf29c541c53f6151b412b6a7559cdc3a1a65e55120')

package() {
  cd "$srcdir"

  install -Dm644 djp.gpg "$pkgdir/usr/share/pacman/keyrings/djp.gpg"
  install -Dm644 djp-trusted "$pkgdir/usr/share/pacman/keyrings/djp-trusted"
}

# vim:set ts=2 sw=2 et:
