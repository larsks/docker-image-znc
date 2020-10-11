#!/bin/sh

: ${ZNC_DATADIR:="/znc-data"}

set -e

if ! [ -f "$ZNC_DATADIR/configs/znc.conf" ]; then
	echo "creating default configuration"
	mkdir -p "$ZNC_DATADIR/configs"
	cp /usr/share/znc/znc.conf.default "$ZNC_DATADIR/configs/znc.conf"

	if ! [ -f "${ZNC_DATADIR}/znc.pem" ]; then
		echo "creating ssl certificate"
		znc -nf -d "${ZNC_DATADIR}" --makepem
	fi
fi

exec znc --foreground --datadir "$ZNC_DATADIR" "$@"

