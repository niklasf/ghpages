FROM alpine
RUN apk fix && \
    apk --no-cache --update add git

VOLUME /git
WORKDIR /git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
