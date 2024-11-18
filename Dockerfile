FROM alpine:3.20.3@sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a

RUN apk add --no-cache curl bash jq gettext-dev

COPY check /opt/resource/check
COPY in    /opt/resource/in
COPY out   /opt/resource/out

RUN chmod +x /opt/resource/out /opt/resource/in /opt/resource/check

ADD test/ /opt/resource-tests/
RUN /opt/resource-tests/all.sh
RUN rm -rf /tmp/*
