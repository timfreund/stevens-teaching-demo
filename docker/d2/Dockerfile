FROM docker.io/golang:1.22

WORKDIR /usr/src/app
RUN go install oss.terrastruct.com/d2@latest
RUN apt-get update && \
    apt-get install -y inotify-tools && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/*
COPY ./build-diagrams.sh .
ENTRYPOINT ["./build-diagrams.sh", "-d", "1"]
