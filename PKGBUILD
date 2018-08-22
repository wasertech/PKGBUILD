# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgbase=djp-meta
pkgname=(
	djp-meta-base
	djp-meta-laptop
	djp-meta-xorg-apps
	djp-meta-anopa
	djp-meta-surface4
	djp-meta-devel
	djp-meta-players
	djp-meta-audio
	djp-meta-present
	djp-meta-office
	djp-meta-latex
	djp-meta-graphics
	djp-meta-print
	djp-meta-samsung
)
pkgver=0.2
pkgrel=2
pkgdesc="Metapackages to manage Arch installations"
arch=(any)
url="https://github.com/djpohly/PKGBUILD"
license=('GPL')

package_djp-meta-base() { pkgdesc="Metapackage for all systems"; depends=(
	asciinema
	bc
	conky-cli
	cryptsetup
	curl
	dhcpcd
	diffutils
	djp-keyring
	dos2unix
	dmenu
	dtach
	dwm
	dzen2
	efibootmgr
	git
	grub
	gvim
	hexedit
	hsetroot
	htop
	intel-ucode
	iproute2
	iputils
	irssi
	kbd-dvorak-djp
	licenses
	linux
	logrotate
	lsof
	lvm2
	macchanger
	man-db
	man-pages
	myrepos
	nmap
	openbsd-netcat
	openntpd
	openssh
	os-prober
	p7zip
	parallel
	pass
	powerpill
	puzzles
	redshift
	rlwrap
	rsync
	rxvt-unicode
	sed
	socat
	srandrd
	sudo
	sysfsutils
	tcpdump
	texinfo
	time
	traceroute
	ttf-fantasque-sans
	unzip
	usbutils
	vcsh
	vi
	vim
	w3m
	wget
	which
	whois
	wmname
	xcursor-vanilla-dmz
	xorg-server
	xorg-xdpyinfo
	xorg-xinit
	xorg-xinput
	xorg-xrandr
	xorg-xset
	xorg-xsetroot
	xorg-xwininfo
	xscreensaver
	xsel
	zip
); }

package_djp-meta-laptop() { pkgdesc="Metapackage for laptops"; depends=(
	acpi
	acpid
	aircrack-ng
	powertop
	terminus-font
	wpa_supplicant
	xorg-xbacklight
); }

package_djp-meta-xorg-apps() { pkgdesc="Metapackage for X applications"; depends=(
	feh
	#firefox
	scrot
	stint
	tabbed
	ttf-et-book
	vimb
	zathura
	zathura-pdf-poppler
	zathura-ps
); }

package_djp-meta-anopa() { pkgdesc="Metapackage for anopa/s6 init"; depends=(
	anopa
	execline
	s6
	skalibs
); }

package_djp-meta-surface4() { pkgdesc="Metapackage for Surface Pro 4 devices"; depends=(
	linux-firmware-surface4
	linux-surface4
	linux-surface4-headers
); }

package_djp-meta-devel() { pkgdesc="Metapackage for development systems"; depends=(
	autoconf
	automake
	avrdude
	binutils
	bison
	ccache
	cloc
	fakeroot
	flex
	gcc
	gdb
	indent
	m4
	make
	patch
	pkgconf
	postgresql
	python
	ruby
	sqlite
	strace
	valgrind
	yarn
); }

package_djp-meta-players() { pkgdesc="Metapackage for media players"; depends=(
	livestreamer
	mpc
	mpd
	mpv
	youtube-dl
); }

package_djp-meta-audio() { pkgdesc="Metapackage for audio editing"; depends=(
	ardour
	audacity
	mixxx
	rosegarden
	soundfont-personalcopy
); }

package_djp-meta-present() { pkgdesc="Metapackage for presentations"; depends=(
	farbfeld
	#impressive
	pdfpc
	sent
	ttf-et-book
); }

package_djp-meta-office() { pkgdesc="Metapackage for office work"; depends=(
	davmail
	khal
	mutt
	openconnect-palo
	vdirsyncer
); }

package_djp-meta-latex() { pkgdesc="Metapackage for LaTeX"; depends=(
	fig2dev
	gnuplot
	latex-template-acm
	texlive-core
	texlive-fontsextra
	texlive-humanities
	texlive-latexextra
	texlive-luximono
	texlive-publishers
	texlive-science
	xfig
); }

package_djp-meta-graphics() { pkgdesc="Metapackage for graphics editing"; depends=(
	fontforge
	gimp
	inkscape
	umlet
); }

package_djp-meta-print() { pkgdesc="Metapackage for printing"; depends=(
	samba
	foomatic-db
	foomatic-db-nonfree
	foomatic-db-nonfree-ppds
	foomatic-db-ppds
); }

package_djp-meta-samsung() { pkgdesc="Metapackage for Samsung laptops"; depends=(
	acpi_call-dkms
); }
