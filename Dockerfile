FROM znc:1.8.2-slim AS build-push

RUN apk --update add \
	git \
	build-base \
	icu-dev \
	openssl-dev \
	curl-dev \
	cmake

RUN git clone https://github.com/jreese/znc-push /tmp/znc-push
RUN cd /tmp/znc-push && \
	PATH=/opt/znc/bin:/usr/bin make curl=yes

FROM znc:1.8.2-slim

RUN apk --update add \
	curl

COPY --from=build-push /tmp/znc-push/push.so /opt/znc/lib64/znc/
COPY znc.conf /opt/znc/share/znc/znc.conf.default
COPY 40-default-config.sh /startup-sequence/
