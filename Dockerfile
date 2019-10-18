FROM fedora:30 AS build-push

RUN dnf -y install \
	git \
	libcurl-devel \
	zlib-devel \
	znc \
	znc-devel \
	@development-tools

RUN git clone https://github.com/jreese/znc-push /tmp/znc-push
RUN cd /tmp/znc-push && make curl=yes

FROM fedora:30

VOLUME /var/lib/znc
ENTRYPOINT ["/entrypoint.sh"]
CMD ["-nf"]

RUN dnf -y install \
	znc \
	znc-modpython \
	; dnf clean all

COPY --from=build-push /tmp/znc-push/push.so /usr/lib64/znc/push.so
COPY entrypoint.sh /entrypoint.sh
