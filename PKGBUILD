# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=linux-firmware-surface4
pkgver=4.18.16.1
_realver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="Additional firmware for Surface Pro 4"
arch=(any)
url="https://github.com/jakeday/linux-surface"
license=('GPL')
source=("https://github.com/jakeday/linux-surface/raw/$_realver/firmware/ipts_firmware_v78.zip")
sha256sums=('396a88633e5d83a76c3eec8633095104188304b9f7c48e030202f0fe70275561')

package() {
	install -d "$pkgdir/usr/lib/firmware/intel/ipts/"
	install -m644 *.bin "$pkgdir/usr/lib/firmware/intel/ipts/"
}
