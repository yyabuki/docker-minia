FROM ubuntu:16.04
MAINTAINER Yukimitsu Yabuki, yukimitsu.yabuki@gmail.com
# We modified attached files (Procfile, run and Dockerfile) created by Rayan Chikhi.

ENV PACKAGES wget
ENV TAR https://github.com/GATB/minia/releases/download/v2.0.7/minia-v2.0.7-bin-Linux.tar.gz
ENV DIR /tmp/minia

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends ${PACKAGES} && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir ${DIR}
RUN cd ${DIR} &&\
    wget --no-check-certificate ${TAR} -O - | tar xzf - --directory . --strip-components=1 &&\
    mv bin/minia /usr/local/bin

ADD Procfile /
ADD run /usr/local/bin/

ENTRYPOINT ["run"]
