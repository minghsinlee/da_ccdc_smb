FROM centos:7
RUN yum -y install epel-release && yum -y install samba samba-common-tools supervisor
COPY conf/* /config/
VOLUME /config /shared
EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp
ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
