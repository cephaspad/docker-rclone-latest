FROM alpine:3.8

LABEL author="colhom@gmail.com"
LABEL maintainer="anywhere@live.at"

RUN apt update && \
    apt -y install wget unzip && \
    curl https://rclone.org/install.sh | sudo bash && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["rclone"]