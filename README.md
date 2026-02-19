# docker-dind

Docker image for CI jobs that need Docker-in-Docker and helper scripts.

## Base image

- Pinned by default to `docker:27.5.1-dind@sha256:aa3df78ecf320f5fafdce71c659f1629e96e9de0968305fe1de670e0ca9176ce`.
- You can override with `DOCKER_IMAGE_TAG` and `DOCKER_IMAGE_DIGEST` build args.

## Build

```bash
docker build --no-cache --pull -t index.exp.railsc.ru/abakpress/dind-testing:latest .
```

## CI kernel compatibility

`prepare-build` sets `DOCKER_INSECURE_NO_IPTABLES_RAW=1` by default for environments where `iptables raw` table is unavailable.
This mostly matters for Docker 28+; on Docker 27 it is typically harmless.
