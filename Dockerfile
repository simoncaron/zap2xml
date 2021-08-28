FROM alpine:3

ENV USERNAME=none
ENV PASSWORD=none
ENV XMLTV_FILENAME=xmltv.xml
ENV OPT_ARGS=

# Wait 12 Hours after run
ENV SLEEPTIME=43200

RUN apk add --no-cache perl perl-html-parser perl-http-cookies perl-lwp-useragent-determined perl-json perl-json-xs
RUN apk add --no-cache perl-lwp-protocol-https perl-uri ca-certificates perl-net-libidn perl-net-ssleay perl-io-socket-ssl perl-libwww perl-mozilla-ca perl-net-http

VOLUME /data
ADD zap2xml.pl /zap2xml.pl
ADD entry.sh /entry.sh
RUN chmod 755 /entry.sh /zap2xml.pl

CMD ["/entry.sh"]
