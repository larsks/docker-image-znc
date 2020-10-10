if ! [ -f "$DATADIR/configs/znc.conf" ]; then
	echo "creating default configuration"
	mkdir -p "$DATADIR/configs"
	cp /opt/znc/share/znc/znc.conf.default "$DATADIR/configs/znc.conf"

	if ! [ -f "${DATADIR}/znc.pem" ]; then
		echo "creating ssl certificate"
		/opt/znc/bin/znc -nf -d "${DATADIR}" --makepem
	fi
fi
