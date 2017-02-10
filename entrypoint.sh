#!/bin/sh

: ${ZNCDIR:=/var/lib/znc}

chown -R znc:znc $ZNCDIR
exec runuser -u znc -- znc -d $ZNCDIR "$@"

