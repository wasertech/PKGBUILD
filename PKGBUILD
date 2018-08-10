# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=linux-firmware-surface4
pkgver=20171209
pkgrel=1
pkgdesc="Additional firmware for Surface Pro 4"
arch=(any)
url="https://github.com/jakeday/linux-surface"
license=('GPL')
source=("https://github.com/jakeday/linux-surface/raw/master/firmware/ipts_firmware_v78.zip")
sha256sums=('f945f5efaa3f019df5ee06b7b6af08d225811c6b5cf040d40885b7631218c085')

package() {
	install -d "$pkgdir/usr/lib/firmware/intel/ipts/"
	install -m644 *.bin "$pkgdir/usr/lib/firmware/intel/ipts/"
}
