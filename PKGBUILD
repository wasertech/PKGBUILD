# Main://aur.archlinux.org/plantuml.gittainer: juantascon <juantascon.aur@horlux.org>

pkgname=plantuml
pkgver=8051
pkgrel=1
pkgdesc="Component that allows to quickly write uml diagrams"
arch=(any)
url="http://plantuml.com/"
license=('GPL')
depends=("java-runtime" "graphviz")
makedepends=("apache-ant" "java-environment")
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz "$pkgname.run")
sha256sums=('eb5278b093a43b512eefd5ac465778777e9b11641d684944dba374e9b9131f4f'
            'dff39e4d8dd8eedb58c1b0a0cf64ab2c404b713e3a42fa5fdf0b6792ca382ed5')

package() {
  install -m 755 -D "$pkgname.run" "$pkgdir/usr/bin/$pkgname"
  
  cd "$srcdir/$pkgname-$pkgver"
  sed 's/target="1.6"/target="1.7"/g' -i build.xml
  ant dist
  install -m 644 -D "$pkgname.jar" "$pkgdir/opt/$pkgname/$pkgname.jar"
}
