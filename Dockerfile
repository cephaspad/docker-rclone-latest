FROM debian:9

LABEL author="colhom@gmail.com"
LABEL maintainer="anywhere@live.at"

ENV RCLONE_VERSION=v1.43.1
ENV RCLONE_LINUX_SHASUM=7b31fb8a5c361e99afa20af161d6219babb10e2b86da1a85583cdcb6797d0e3c

RUN apt update && \
    apt -y install wget unzip && \
    mkdir -p /tmp/rclone && cd /tmp/rclone && \
    wget --quiet https://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    echo "${RCLONE_LINUX_SHASUM}  rclone-${RCLONE_VERSION}-linux-amd64.zip" | sha256sum -c && \
    unzip rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    cp ./rclone-v*-linux-amd64/rclone /usr/sbin && \
    chown root:root /usr/sbin/rclone && \
    chmod 755 /usr/sbin/rclone && \
    cd / && \
    apt remove -y wget unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["rclone"]