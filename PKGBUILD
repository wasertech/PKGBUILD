# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=android-apktool
pkgver=2.0.3
pkgrel=1
pkgdesc="a tool for reengineering Android apk files"
arch=(i686 x86_64)
url="http://forum.xda-developers.com/showthread.php?t=1755243"
license=('Apache 2.0')
depends=('java-runtime' 'android-sdk-build-tools')
source=(apktool.jar::https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${pkgver}.jar
        'http://android-apktool.googlecode.com/files/apktool-install-linux-r04-brut1.tar.bz2')
sha256sums=('ceca3e49bfc697c918aaff160c28244f27a2c1c741af62a70e1558a066a16dd3'
            'cffa5c0a46bab9c66da02cc5db651c3a8321bee98580815e44c802d62a696dfa')

prepare() {
  cd "$srcdir"
  sed -i 's/libdir=.*progdir/libdir="\/usr\/share\/'$pkgname'/' apktool
}
package() {
  install -Dm 0755 "${srcdir}/apktool" "${pkgdir}/usr/bin/apktool"
  install -Dm 0644 "${srcdir}/apktool.jar" "$pkgdir/usr/share/$pkgname/apktool.jar"
}
