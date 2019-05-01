# Build Consul Server Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=alpine
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

# Install Imagemagick
RUN apk add --no-cache -U imagemagick && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /input /output && \
  chown ${ALPINE_USER}:${ALPINE_USER} -R /input /output

USER ${ALPINE_USER}
WORKDIR /input
VOLUME /input /output
CMD ["convert"]

