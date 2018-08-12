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
	djp-meta-present
	djp-meta-email
	djp-meta-calendar
	djp-meta-latex
	djp-meta-graphics
	djp-meta-security
	djp-meta-print
)
pkgver=0.1
pkgrel=5
pkgdesc="Metapackages to manage Arch installations"
arch=(any)
url="https://github.com/djpohly"
license=('GPL')

package_djp-meta-base() { depends=(
	bc
	cryptsetup
	curl
	diffutils
	djp-keyring
	dtach
	efibootmgr
	git
	grub
	htop
	intel-ucode
	iproute2
	iputils
	kbd-dvorak-djp
	licenses
	linux
	logrotate
	lsof
	lvm2
	man-db
	man-pages
	myrepos
	openssh
	os-prober
	p7zip
	parallel
	pass
	powerpill
	rlwrap
	rsync
	sed
	socat
	sudo
	sysfsutils
	texinfo
	unzip
	usbutils
	vcsh
	vi
	vim
	w3m
	wget
	which
	zip
	conky-cli
	dmenu
	dwm
	dzen2
	gvim
	hsetroot
	hsetroot
	redshift
	rxvt-unicode
	srandrd
	ttf-fantasque-sans
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
); }

package_djp-meta-laptop() { depends=(
	acpi
	acpid
	aircrack-ng
	powertop
	terminus-font
	wpa_supplicant
	xorg-xbacklight
); }

package_djp-meta-xorg-apps() { depends=(
	feh
	#firefox
	scrot
	tabbed
	vimb
	zathura
	zathura-pdf-poppler
	zathura-ps
); }

package_djp-meta-anopa() { depends=(
	anopa
	execline
	s6
	skalibs
); }

package_djp-meta-surface4() { depends=(
	linux-firmware-surface4
	linux-surface4
	linux-surface4-headers
); }

package_djp-meta-devel() { depends=(
	gdb
	indent
	python
	ruby
	sqlite
	strace
	valgrind
); }

package_djp-meta-players() { depends=(
	mpc
	mpd
	mpv
	youtube-dl
); }

package_djp-meta-present() { depends=(
	farbfeld
	#impressive
	pdfpc
	sent
); }

package_djp-meta-email() { depends=(
	mutt
); }

package_djp-meta-calendar() { depends=(
	davmail
	khal
	vdirsyncer
); }

package_djp-meta-latex() { depends=(
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

package_djp-meta-graphics() { depends=(
	fontforge
	gimp
	inkscape
); }

package_djp-meta-security() { depends=(
	aircrack-ng
	john
	macchanger
	nmap
	openbsd-netcat
	tcpdump
	traceroute
	whois
); }

package_djp-meta-print() { depends=(
	samba
	foomatic-db
	foomatic-db-nonfree
	foomatic-db-nonfree-ppds
	foomatic-db-ppds
); }
