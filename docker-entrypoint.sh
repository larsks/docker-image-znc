#!/bin/sh

: ${ZNCDIR:=/var/lib/znc}

chown -R znc:znc $ZNCDIR
exec su-exec znc znc -d $ZNCDIR "$@"

