FROM alpine
RUN apk fix && \
    apk --no-cache --update add git

VOLUME /git
WORKDIR /git

ENTRYPOINT ["/entrypoint.sh"]
