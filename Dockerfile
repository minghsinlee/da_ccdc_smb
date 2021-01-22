FROM alpine:latest
RUN apk --no-cache upgrade && apk --no-cache add samba samba-common-tools supervisor
COPY conf/* /config
RUN addgroup -g 1000 dongao && adduser -D -H -G dongao -s /bin/false -u 1000 dongao
RUN echo -e "Abc,123.!/nAbc,123.!" | smbpasswd -a -s -c /config/smb.conf dongao
VOLUME /config /shared
EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp
ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
