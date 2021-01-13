FROM node:14.15.1-alpine3.12

RUN apk update && apk upgrade && apk add --no-cache \
    wget \
    build-base \
    libtool \
    bc \
    zlib-dev \
    expat-dev \
    jpeg-dev \
    tiff-dev \
    glib-dev \
    libjpeg-turbo-dev \
    libexif-dev \
    lcms2-dev \
    fftw-dev \
    giflib-dev \
    libpng-dev \
    libwebp-dev \
    orc-dev \
    libgsf-dev \
    gdk-pixbuf-dev \
    poppler-dev \
    librsvg-dev \
    fontconfig \
    ttf-ubuntu-font-family

WORKDIR /tmp

# libvips installation
ARG VIPS_VERSION=8.10.1
ARG VIPS_URL=https://github.com/libvips/libvips/releases/download

RUN wget ${VIPS_URL}/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.gz \
  && tar xf vips-${VIPS_VERSION}.tar.gz \
  && cd vips-${VIPS_VERSION} \
  && ./configure \
  && make \
  && make install \
  && cd - \
  && rm -rf vips-${VIPS_VERSION}.tar.gz \
  && rm -rf vips-${VIPS_VERSION}
