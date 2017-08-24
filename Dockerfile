FROM golang:alpine

ADD . /go/src/ios-docs-server

RUN \
    apk add --no-cache bash && \
    apk add --no-cache git && \
    cd /go/src/ios-docs-server && \
    go get -v && \
    apk del git && \
    go build -o /srv/ios-docs-server && \
    rm -rf /go/src/*

EXPOSE 8989

WORKDIR /srv

CMD ["/srv/ios-docs-server"]