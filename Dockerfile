FROM fedora:30

VOLUME /var/lib/znc
ENTRYPOINT ["/entrypoint.sh"]
CMD ["-nf"]

RUN dnf -y install \
	znc \
	znc-modpython \
	; dnf clean all

COPY entrypoint.sh /entrypoint.sh
