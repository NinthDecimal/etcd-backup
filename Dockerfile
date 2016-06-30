FROM gliderlabs/alpine:3.4

COPY . /go/src/github.com/odise/etcd-backup
RUN apk-install -t build-deps go git \
	&& cd /go/src/github.com/odise/etcd-backup \
	&& export GOPATH=/go \
	&& go get \
	&& go get github.com/coreos/go-etcd/etcd \
	&& go build -o /bin/etcd-dump \
	&& rm -rf /go \
	&& apk del --purge build-deps
