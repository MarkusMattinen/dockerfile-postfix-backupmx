# postfix, confd and supervisord on trusty
FROM markusma/confd:0.8.0

RUN apt-get update \
 && apt-get install -y --no-install-recommends postfix busybox-syslogd \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/etc/confd /etc/confd
ADD config/etc/postfix /etc/postfix
ADD config/etc/supervisor/conf.d /etc/supervisor/conf.d

EXPOSE 25 587
VOLUME [ "/var/spool/postfix", "/usr/local/etc/ssl/private" ]
CMD [ "/init" ]
