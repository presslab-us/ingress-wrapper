ARG BUILD_FROM
FROM $BUILD_FROM

# Set workdir
WORKDIR /opt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
        g++ \
        gcc \
        libc-dev \
        linux-headers \
        make\
    \
    && apk add --no-cache \
        git \
        lua-resty-http \
        nginx-mod-http-lua \
        nginx \
        openssh-client \
        patch \
    \
    && apk del --no-cache --purge .build-dependencies \
    && rm -fr \
        /tmp/* \
        /etc/nginx

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Ingress Wrapper" \
    io.hass.description="Proxy That uses Home Assistant Ingress and Nginx to map any local port" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    org.opencontainers.image.title="Ingress Wrapper" \
    org.opencontainers.image.description="Proxy That uses Home Assistant Ingress and Nginx to map any local port" \
    org.opencontainers.image.licenses="Apache-2.0" \
    org.opencontainers.image.url="https://github.com/marciogranzotto/ingress-wrapper" \
    org.opencontainers.image.source="https://github.com/marciogranzotto/ingress-wrapper" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
