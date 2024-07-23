FROM alpine:3.20.2@sha256:0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5

RUN apk add --no-cache curl bash jq gettext-dev

COPY check /opt/resource/check
COPY in    /opt/resource/in
COPY out   /opt/resource/out

RUN chmod +x /opt/resource/out /opt/resource/in /opt/resource/check

ADD test/ /opt/resource-tests/
RUN /opt/resource-tests/all.sh
RUN rm -rf /tmp/*
