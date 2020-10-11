FROM fedora:33 AS build-push

RUN yum -y install \
	@development-tools \
	znc \
	znc-devel
RUN yum -y install \
	git \
	libicu-devel \
	openssl-devel \
	curl-devel \
	cmake

RUN yum -y install \
	zlib-devel

RUN git clone https://github.com/jreese/znc-push /tmp/znc-push
RUN cd /tmp/znc-push && make curl=yes

FROM fedora:33

RUN yum -y install \
	znc \
	curl

COPY --from=build-push /tmp/znc-push/push.so /usr/lib64/znc/
COPY znc.conf /usr/share/znc/znc.conf.default
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

USER znc
