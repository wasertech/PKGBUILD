# Maintainer: Devin J. Pohly <djpohly@gmail.com>
pkgname=netgraph
pkgver=0.3
pkgrel=1
pkgdesc="Command-line graph for network traffic"
arch=(any)
license=('GPL')
depends=('bash' 'stag-graph' 'bmon')
source=("$pkgname")
md5sums=('85e9aefc062f0babde75cbbf436a9257')

package() {
	install -D "$srcdir/netgraph" "$pkgdir/usr/bin/netgraph"
}
