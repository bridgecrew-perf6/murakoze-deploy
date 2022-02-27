FROM golang:1.9.3-alpine
LABEL maintainer="Joshua <jos@jos.co>"

RUN apk add --update --no-cache git

ADD . "/go/src/github.com/nzajos-org/murakoze"

WORKDIR /go/src/github.com/nzajos-org/murakoze
RUN go get ./...
RUN go install .

VOLUME /data

ENTRYPOINT [ "/go/bin/murakoze" ]