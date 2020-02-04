FROM debian:buster
LABEL author="Serge NOEL <serge.noel@easylinux.fr>"

RUN apt-get update \
    && apt-get install -y unzip perl wget python \
    && cd /tmp \
    && wget https://github.com/BenLangmead/bowtie2/releases/download/v2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip \
    && unzip bowtie2-2.3.5.1-linux-x86_64.zip \
    && cd /tmp/bowtie2-2.3.5.1-linux-x86_64 \
    && cp bowtie2* /usr/local/bin \
    && rm /usr/local/bin/*-debug \
    && rm -rf /tmp/* \
    && mkdir /Data

COPY Files/ /
WORKDIR /Data

VOLUME /Data
CMD ["/usr/local/bin/launch-bowtie2"]

