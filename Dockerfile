FROM znc:1.8.2-slim AS build-push

RUN apk --update add \
	git \
	build-base \
	znc-dev \
	icu-dev \
	openssl-dev \
	curl-dev

RUN git clone https://github.com/jreese/znc-push /tmp/znc-push
RUN cd /tmp/znc-push && make curl=yes

FROM znc:1.8.2-slim

COPY --from=build-push /tmp/znc-push/push.so /opt/znc/lib64/znc/
COPY znc.conf /opt/znc/share/znc/znc.conf.default
COPY 40-default-config.sh /startup-sequence/
