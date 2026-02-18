ARG DOCKER_IMAGE_TAG=27.5.1-dind
ARG DOCKER_IMAGE_DIGEST=sha256:aa3df78ecf320f5fafdce71c659f1629e96e9de0968305fe1de670e0ca9176ce
FROM docker:${DOCKER_IMAGE_TAG}@${DOCKER_IMAGE_DIGEST}
# 18.02.26 index.exp.railsc.ru/abakpress/dind-testing:latest

LABEL org.opencontainers.image.title="docker-dind" \
      org.opencontainers.image.description="Docker-in-Docker helper image with cached pulls and CI bootstrap scripts" \
      org.opencontainers.image.source="https://github.com/abak-press/docker-dind"

ARG DIP_VERSION=6.1.0

RUN set -eux; \
    apk add --no-cache ca-certificates curl gcompat python3 py3-pip; \
    update-ca-certificates

RUN set -eux; \
    dip_url="https://github.com/bibendi/dip/releases/download/v${DIP_VERSION}/dip-Linux-x86_64"; \
    curl -fsSL "${dip_url}" -o /usr/local/bin/dip; \
    chmod +x /usr/local/bin/dip

COPY prepare-build /usr/local/bin/prepare-build
COPY fetch-images /usr/local/bin/fetch-images
RUN chmod +x /usr/local/bin/prepare-build /usr/local/bin/fetch-images

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD docker info >/dev/null 2>&1 || exit 1
