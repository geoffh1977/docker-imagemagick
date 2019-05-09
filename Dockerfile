# Build Imagemagick Container
FROM geoffh1977/alpine:latest
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
