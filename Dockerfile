FROM golang:1.10-alpine

RUN apk add --no-cache curl git && rm -rf /var/cache/apk/*
RUN curl https://glide.sh/get | sh

WORKDIR /go/src/github.com/marcwickenden/auger
ADD     . /go/src/github.com/marcwickenden/auger
RUN     glide install -v && go install -v github.com/marcwickenden/auger && chmod +x /go/bin/auger

ENTRYPOINT ["/go/bin/auger"]
