#!/bin/sh

# Add crossbuild options if required
#if [[ "$(cat /etc/os-arch)" != "$(cat ${KISS_ROOT}/etc/os-arch)" ]]; then
#    export KISS_MESONOPTS="--cross-file=${KISS_ROOT}/usr/share/meson/host.meson --cross-file=${KISS_ROOT}/usr/share/meson/target.meson --cross-file=sysroot.meson "
#    echo -e "[properties]\n\sys_root = '${KISS_ROOT}/'"
#fi

if [[ "$(cat /etc/os-arch)" != "$(cat /etc/os-release)" ]]; then
    echo "NEQ!"
else
    echo "EQ!"
fi
