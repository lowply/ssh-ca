FROM alpine:latest
RUN apk add openssh git
WORKDIR /root
ENTRYPOINT /bin/sh
