FROM alpine:3.12 AS build-push

RUN apk --update add \
	git \
	build-base \
	znc-dev \
	icu-dev \
	openssl-dev \
	curl-dev

RUN git clone https://github.com/jreese/znc-push /tmp/znc-push
RUN cd /tmp/znc-push && make curl=yes

FROM alpine:3.12

VOLUME /var/lib/znc
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-nf"]

RUN apk add --update \
	curl \
	su-exec \
	znc \
	znc-modpython

COPY --from=build-push /tmp/znc-push/push.so /usr/lib/znc/push.so
COPY docker-entrypoint.sh /docker-entrypoint.sh
