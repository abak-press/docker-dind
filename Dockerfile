FROM gitlab/dind

ARG DIP_VERSION=3.8.3

RUN curl -L https://github.com/bibendi/dip/releases/download/v$DIP_VERSION/dip-Linux-x86_64 > /usr/local/bin/dip \
  && chmod +x /usr/local/bin/dip

ADD prepare-build /usr/local/bin/
ADD fetch-images /usr/local/bin/
