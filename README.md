# [Glasnost Linux](https://www.glasnost.org) Main Repo

Glasnost Linux is a Linux distribution forked from [KISS Linux](https://kisslinux.org/)

## Differences between KISS Linux and Glasnost Linux
 - Clang is used as the default compiler
 - LLVM bintuils are used instead of GNU binutils
 - The KISS package manager is modified to support cross-compilation and rudimentary binary package updates
 - Cross compilation of packages is supported wherever possible
 - Built packages are located in: ~/.cache/kiss/bin/_arch_
 - **kiss-bup** utility is provided to allow binary package updates on remote machines. Uses busybox httpd and curl
 - For the KISS package manager, a value in the 2nd field of the `depends` file now implies that a package is required on the build machine, but not on the target machine
 
This system allows cross compilation of packages between any of the supported architectures:
 - aarch64
 - armv7
 - i686
 - powerpc64
 - powerpc64le
 - riscv64
 - x86_64
 
chroot tarballs are provided for each architecture [here](https://github.com/glasnostlinux/glasnost/releases).

Installation should be treated similar to [KISS Linux](https://kisslinux.org/install).

If you don't want to use the tarballs, it may be possible to bootstrap using [this](https://github.com/konimex/kiss-llvm) repo.

## Objectives
Make building packages for foreign architectures as easy as building native packages on KISS Linux.


## How to cross build
If you are cross-building you need to know:
 - The architecture you are building _on_
 - The architecture you are building _for_

1. You need to run Glasnost on the machine you are building _on_.  Working inside a chroot is fine.
2. Inside your Glasnost installation, download the Glasnost tarball for the architecture you want to build _for_.
3. Use `sudo` to extract the tarball somewhere.
4. Set the environment variable `KISS_ROOT` to that location.
5. Run `kiss b packagename` or `kiss u` as you would normally. You can leave your `KISS_PATH` the same.

### Example: building a package for the pinephone (aarch64) on an x86_64 machine
On your installation of glasnost x86_64:
1. Fetch the chroot tarball for aarch64
2. Extract the tarball into a directory which represents your target machine. For example: 
`mkdir glasnost-pinephone`
`tar xf glasnost-chroot-aarch64-2021.10-01.tar.xz -C glasnost-pinephone --strip-components=1`
3. `KISS_ROOT=glasnost-pinephone kiss b packagename`

## How to install cross-built packages onto another machine
1. On your build machine, go to ~/.cache/kiss/bin
2. Run httpd on some port. For example: `httpd -p 54321`
3. Run `ls`, make a note of the directory name that contains the packages you just built. This will be something like `glasnost-pinephone_2ebab4c766acfa8e3cec1678f3449faa` in the above example.
4. On the target machine (the one that will receive binary updates) run `export KISS_REMOTE_REPO=http://myserver:54321/reponame`, where _reponame_ is the directory name from step 3.
5. On the target machine, run `kiss-bup`.

This is not like normal package management on e.g. Arch, where you can install particular binary packages from a remote repo.  Glasnost and KISS are more like Gentoo, where you build packages yourself.  On these distros you would not generally build all the packages in your repo - just the ones you are interested in using. 

In Glasnost, you download and extract a chroot which becomes a binary repo for the target machine.  When you use  `kiss-bup`, _any packages built for that repo are installed on the target machine._

You can maintain multiple binary repos for any supported architecture.

## Motivation
I prefer to use hardware which does not use non-free firmware or contain monitoring processors to which I do not have access. I also prefer to build the packages on my system to my own requirements as needed.

There are now several machines available capable of running Linux which do not have [Intel ME](https://en.wikipedia.org/wiki/Intel_Management_Engine), [AMD PSP](https://en.wikipedia.org/wiki/AMD_Platform_Security_Processor) or similar technologies. Some like the [Talos II](https://www.raptorcs.com/TALOSII/) have many cores and are capable of building large packges like Firefox in a relatively short time.

Others for example the [PineBook Pro](https://www.pine64.org/pinebook-pro/) or [PinePhone](https://www.pine64.org/pinephone/) have relatively open hardware but are slower and may take many hours to compile larger packages.


I wanted a way to build packages on a more powerful machine and distribute them to a less powerful machine, regardless of architecture.
Something like FreeBSD's [Poudriere](https://github.com/freebsd/poudriere/wiki) but simpler, for Linux.

### Thanks to:
 - [Dylan Araps](https://github.com/dylanaraps) for creating [KISS Linux](https://k1ss.org). Glasnost uses the KISS package manager and package repositories.
 - [M. Herdiansyah](https://github.com/konimex) for creating the [kiss-llvm](https://github.com/konimex/kiss-llvm) bootstrap repo. This is what was used to bootstrap Glasnost.
