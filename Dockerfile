FROM alpine:latest
RUN apk --no-cache upgrade && apk --no-cache add samba samba-common-tools supervisor
COPY conf/* /config/
VOLUME /config /shared
EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp
ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
