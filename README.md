# [Glasnost Linux](https://www.glasnost.org) Main Repo

This repository contains the build files for Glasnost. This is for use with the KISS package manager in the glasnostlinux repo.

This allows cross compilation between any of the supported architectures:
 - aarch64
 - armv7
 - i686
 - powerpc64
 - powerpc64le
 - riscv64
 - x86_64
 
chroot tarballs are provided for each architecture [here](https://github.com/glasnostlinux/glasnost/releases).

Installation should be treated similar to [KISS Linux](https://k1sslinux.org/install).

## Differences from KISS Linux
 - Clang is used as the system compiler.
 - Cross compilation is supported by all packages.
 - Built packages are located in: ~/.cache/kiss/bin/_arch_
 - **kiss-bup** utility to allow binary updates on remote machines. Uses busybox httpd and curl.

## How to cross build
1. You need to run Glasnost on your build machine.  Working inside a chroot is fine.
2. Inside your Glasnost installation, download the Glasnost tarball for the architecture you want to build for.
3. Use _sudo_ to extract the tarball somewhere.
4. Set KISS_ROOT to that location.
5. Run `kiss b packagename` same as you would normally

## How to install cross-built packages onto another machine
1. On your build machine, go to ~/.cache/kiss/bin
2. Run httpd on some port. For example: `httpd -p 54321`
3. Run `ls -la`, make a note of the directory name that contains the packages you just built.
4. On the target machine (the one that will receive binary updates) run `export KISS_REMOTE_REPO=http://myserver:54321/reponame`, where _reponame_ is from step 3.
5. On the target machine, run `kiss-bup`.

_Any packages built on the build machine are installed on the target machine._

## Motivation
There are now several machines available capable of running Linux which do not have [Intel ME](https://en.wikipedia.org/wiki/Intel_Management_Engine), [AMD PSP](https://en.wikipedia.org/wiki/AMD_Platform_Security_Processor) or similar technologies. Some, like the [Talos II](https://www.raptorcs.com/TALOSII/) have many cores and are capable of building large packges like WebKit in a relatively short time.

Others, for example the [PineBook Pro](https://www.pine64.org/pinebook-pro/) or [PinePhone](https://www.pine64.org/pinephone/), may take many hours to compile larger packages.

I wanted a way to build packages on a more powerful machine and distribute them to a less powerful machine, regardless of architecture.
Something like FreeBSD's [Poudriere](https://github.com/freebsd/poudriere/wiki) but simpler, for Linux.

### Thanks to:
 - [Dylan Araps](https://github.com/dylanaraps) for creating [KISS Linux](https://k1ss.org). Glasnost uses the KISS package manager and package repositories.
 - [M. Herdiansyah](https://github.com/konimex) for creating the [kiss-llvm](https://github.com/konimex/kiss-llvm) bootstrap repo. This is what was used to bootstrap Glasnost.
