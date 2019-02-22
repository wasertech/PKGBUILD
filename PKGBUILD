# Maintainer: Markus Unterwaditzer <markus-aur@unterwaditzer.net>

_name=shippai
pkgname=python-${_name}
pkgver=0.3.2
pkgrel=1
pkgdesc="Rust failures in other languages"
arch=('any')
url="https://github.com/untitaker/shippai"
license=('MIT')
depends=('python')
source=("https://github.com/untitaker/$_name/archive/$pkgver.tar.gz")
sha512sums=('c57aaa28c6fa11e7607a37c4e243ed1d0cdb8648a80671676a4c029fc1e9ece39c7dbff43c37f658794ccd03afdbeefcaa542511438765ac67ab9a0f8fe5ac71')

build() {
  cd "${_name}-${pkgver}/python"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}/python"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
