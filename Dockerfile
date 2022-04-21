FROM alpine
RUN apk fix && \
    apk --no-cache --update add git

VOLUME /github/workspace
WORKDIR /github/workspace

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
