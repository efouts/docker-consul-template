FROM gliderlabs/alpine:3.1

RUN apk update \
  && apk add build-base git go supervisor \
  && GOPATH=/go go get github.com/hashicorp/consul-template \
  && cd /bin \
  && GOPATH=/go go build github.com/hashicorp/consul-template \
  && rm -rf /go \
  && apk del build-base git go \
  && rm -rf /var/cache/apk/*

