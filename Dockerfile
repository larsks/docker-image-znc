FROM fedora:25
MAINTAINER "https://pagure.io/atomic-wg"

# ======================================================================
# FLIBS Metadata

ENV NAME=znc \
    VERSION=1 \
    RELEASE=1 \
    ARCH=x86_64

LABEL BZComponent="$NAME" \
	Name="$FGC/$NAME" \
	Version="$VERSION" \
	Release="$RELEASE.$DISTTAG" \
	Architecture="$ARCH"

# ======================================================================

VOLUME /var/lib/znc
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["-nf"]

RUN dnf -y install \
	znc \
	znc-modpython \
	; dnf clean all

COPY entrypoint.sh /entrypoint.sh
