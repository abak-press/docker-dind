FROM docker:dind

RUN apk add --no-cache python3 py3-pip

ARG DIP_VERSION=3.8.3

RUN wget -O /usr/local/bin/dip https://github.com/bibendi/dip/releases/download/v$DIP_VERSION/dip-Linux-x86_64 \
  && chmod +x /usr/local/bin/dip

ADD prepare-build /usr/local/bin/
ADD fetch-images /usr/local/bin/
