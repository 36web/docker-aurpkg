# aurpkg

Ever wanted to install an [AUR] package but don't want to install all those build base-devel dependenices or just want to build an AUR package to install on other Arch environments without build dependenices?

Here's a Docker tool can do that for you.

## Usage

### Pull image

```shell
docker pull 36web/aurpkg
```

### Build an AUR package

```shell
docker run --rm --init -v $PWD:/pkg -e USER_ID=`id -u` -e GROUP_ID=`id -g` 36web/aurpkg PACKAGE_NAME
```

replace PACKAGE_NAME with the name of your desired package on [AUR].

example:

```shell
docker run --rm --init -v $PWD:/pkg -e USER_ID=`id -u` -e GROUP_ID=`id -g` 36web/aurpkg telegram-desktop-bin
```

Docker will build the package and put it in the directory named as PACKAGE_NAME with PKGBUILD for package details.
You may later install the package with

```shell
sudo pacman -U package.pkg.tar.xz
```

### Make an alias

You may also make it an alias for further usage.

```shell
alias aurpkg='docker run --rm --init -v $PWD:/pkg -e USER_ID=`id -u` -e GROUP_ID=`id -g` 36web/aurpkg '
```

and just run

```shell
aurpkg PACKAGE_NAME
```

at anytime.

## Issue report

https://github.com/36web/docker-aurpkg/issues

[AUR]: https://aur.archlinux.org/packages/ "Arch User Repository"
