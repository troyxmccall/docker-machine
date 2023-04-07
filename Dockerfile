FROM golang:1.19.7-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
                openssh-client \
                rsync \
                fuse \
                sshfs \
        && rm -rf /var/lib/apt/lists/*

ENV GO111MODULE=on

RUN go get golang.org/x/tools@v0.1.12
RUN go get golang.org/x/lint/golint
RUN go get golang.org/x/tools/cover

ENV GO111MODULE=off

ENV USER root
WORKDIR /go/src/github.com/docker/machine

COPY . ./
RUN mkdir bin
