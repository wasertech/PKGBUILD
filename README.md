# aurci [![Build Status](https://travis-ci.org/localnet/aurci.svg?branch=master)](https://travis-ci.org/localnet/aurci)

Use [Travis CI](https://travis-ci.org/localnet/aurci) for building and packaging a few [AUR](https://aur.archlinux.org/) packages and deploy them to [GitHub Releases](https://github.com/localnet/aurci/releases) so it can be used as repository in Arch Linux.

## Use repository

To use as custom repository in Arch Linux, add to file `/etc/pacman.conf`:

```
[aurci]
SigLevel = Optional TrustAll
Server = https://github.com/localnet/aurci/releases/download/repository
```

Then on the command line:

```
pacman -Sy        # Refresh package database.
pacman -Sl aurci  # Show packages in repository.
```

**NOTE:** Online list of currently maintained [packages](https://github.com/localnet/aurci/blob/master/pkglist).
