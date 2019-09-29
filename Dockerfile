FROM alpine

FROM alpine

RUN apk --update add git less openssh bash && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN mkdir /work
RUN mkdir /scripts

ADD deploy.sh /scripts/
RUN chmod a+x /scripts/deploy.sh

WORKDIR /work
CMD ["/scripts/deploy.sh"]
