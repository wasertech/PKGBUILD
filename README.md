# PKGBUILD

Use GitHub Actions for building and packaging a few [AUR](https://aur.archlinux.org) packages and deploy them to [GitHub Releases](https://github.com/djpohly/PKGBUILD/releases) so it can be used as a repository in [Arch Linux](https://www.archlinux.org).  Based on [cromerc/aurci](https://github.com/cromerc/aurci).


## Using as a pacman repository

To use as custom repository in [Arch Linux](https://www.archlinux.org), add to file `/etc/pacman.conf`:

```
[PKGBUILD]
SigLevel = Optional TrustAll
Server = https://github.com/djpohly/PKGBUILD/releases/download/repository
```

**NOTE:** List of currently maintained packages can change at any moment.  If you trust the djp-keyring package, you can update `SigLevel` to `Required TrustedOnly`.


## Customizing

To build AUR packages of your own selection, fork this repository.  The master branch contains most of the build actions.

  - Fork this GitHub repository.
  - Create a release (name currently hardcoded as "repository") in which your package repository will be stored.
  - Generate a personal access token with scope `public_repo`.
  - In repository settings, add this token as a secret with the name `PUSH_TOKEN`.
  - If you would like to enable package and repository signing:
      * Create a PGP key for signing.
      * Generate a random hex key and initialization vector (IV) with which to encrypt the PGP key.
      * Add these encryption secrets as repository secrets called `ENCRYPTION_KEY` and `ENCRYPTION_IV`.
      * Encrypt your signing key using `openssl aes-256-cbc` and your chosen key/IV.  Replace `signing.key.enc` with this file and commit.
  - For each package you would like to build, use `git merge --allow-unrelated-histories` to merge the package's branch from the AUR with the pkgbase branch from this repository.  This will enable you to pull updates from both the AUR and the pkgbase branch.
  - Each time you push an update to the repository, the package will be built and uploaded, and the repository updated.
