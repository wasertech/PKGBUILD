# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgbase=djp-meta
pkgname=(
	djp-meta-base
	djp-meta-laptop
	djp-meta-xorg
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
	djp-meta-wheaton
	djp-meta-android
	djp-meta-java
	djp-meta-re
	djp-meta-radio
)
pkgver=0.2
pkgrel=11
pkgdesc="Metapackages to manage Arch installations"
arch=(any)
url="https://github.com/djpohly/PKGBUILD"
license=('GPL')

package_djp-meta-base() { pkgdesc="Metapackage for all systems"; depends=(
	android-tools
	android-udev
	asciinema
	bc
	cryptsetup
	curl
	dhcpcd
	diffutils
	djp-keyring
	dmidecode
	dnsmasq
	dos2unix
	dosfstools
	dtach
	efibootmgr
	git
	gptfdisk
	grub
	gvim
	hexedit
	htop
	inotify-tools
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
	perl-authen-sasl
	perl-mime-tools
	perl-net-smtp-ssl
	powerpill
	pv
	pwgen
	redshift
	rlwrap
	rsync
	rxvt-unicode-terminfo
	s-nail
	sed
	socat
	sudo
	sysfsutils
	tcpdump
	terminus-font
	texinfo
	time
	tmux
	traceroute
	unzip
	usbutils
	vcsh
	vi
	vim
	w3m
	wget
	which
	whois
	zip
); }

package_djp-meta-xorg() { pkgdesc="Metapackage for graphical systems"; depends=(
	compton
	conky-cli
	dina-font-latin1
	dmenu
	dwm
	dzen2
	feh
	#firefox
	gvim
	hsetroot
	otf-alegreya-sans
	puzzles
	rxvt-unicode
	scrot
	smartmontools
	srandrd
	stint
	tabbed
	tigervnc
	ttf-et-book
	ttf-fantasque-sans
	unrar
	vimb
	wmname
	xcursor-vanilla-dmz
	xorg-server
	xorg-xdpyinfo
	xorg-xev
	xorg-xinit
	xorg-xinput
	xorg-xprop
	xorg-xrandr
	xorg-xset
	xorg-xsetroot
	xorg-xwininfo
	xscreensaver
	xsel
	xterm
	zathura
	zathura-pdf-poppler
	zathura-ps
); }

package_djp-meta-laptop() { pkgdesc="Metapackage for laptops"; depends=(
	acpi
	acpid
	aircrack-ng
	powertop
	wpa_supplicant
	x11-touchscreen-calibrator
	xorg-xbacklight
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
	cgdb
	cloc
	dfu-util
	diffstat
	fakeroot
	flex
	gcc
	gdb
	indent
	m4
	make
	namcap
	pacman-contrib
	patch
	patchutils
	pkgconf
	postgresql
	python
	ruby
	shellcheck
	sparse
	sqlite
	strace
	teensy-loader-cli
	valgrind
	yarn
); }

package_djp-meta-players() { pkgdesc="Metapackage for media players"; depends=(
	alsa-utils
	calf
	jalv
	mpc
	mpd
	mpv
	sox
	streamlink
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
	libreoffice
	mutt
	openconnect
	vdirsyncer
); }

package_djp-meta-latex() { pkgdesc="Metapackage for LaTeX"; depends=(
	fig2dev
	gnuplot
	latex-template-acm
	libreoffice-fresh
	make
	minted
	pandoc
	python
	tectonic
	texlive-core
	texlive-fontsextra
	texlive-humanities
	texlive-latexextra
	texlive-luximono
	texlive-pictures
	texlive-publishers
	texlive-science
	xfig
); }

package_djp-meta-graphics() { pkgdesc="Metapackage for graphics editing"; depends=(
	fontforge
	gimp
	graphviz
	inkscape
	umlet
); }

package_djp-meta-print() { pkgdesc="Metapackage for printing"; depends=(
	cups
	foomatic-db
	foomatic-db-nonfree
	foomatic-db-nonfree-ppds
	foomatic-db-ppds
	samba
); }

package_djp-meta-samsung() { pkgdesc="Metapackage for Samsung laptops"; depends=(
	acpi_call-dkms
); }

package_djp-meta-wheaton() { pkgdesc="Metapackage for campus systems"; depends=(
	nfs-utils
	sssd
); }

package_djp-meta-android() { pkgdesc="Metapackage for Android development"; depends=(
	android-platform
	android-sdk-build-tools
	android-studio
	android-tools
	ant
	maven
	ninja
	repo
	schedtool
); }

package_djp-meta-java() { pkgdesc="Metapackage for Java development"; depends=(
	ant
	eclipse-java
	fernflower-git
	gradle
	jad
	junit
); }

package_djp-meta-re() { pkgdesc="Metapackage for reverse engineering"; depends=(
	acpica
	binwalk
	cabextract
	efitools
	radare2
	uefitool
	wine
); }

package_djp-meta-radio() { pkgdesc="Metapackage for radio communication/analysis"; depends=(
	audacity
	baudline
	dsdcc
	gnuradio
	gnuradio-companion
	gnuradio-osmosdr
	hackrf
	gqrx
	inspectrum
	multimon-ng
	qsstv
	sox
	urh
); }
