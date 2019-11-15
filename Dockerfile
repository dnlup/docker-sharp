FROM node:12-buster

WORKDIR /tmp

RUN apt-get update -y --no-install-recommends --allow-unauthenticated --no-upgrade \
    && apt-get install -y \
    build-essential \
	wget \
	pkg-config \
    # libvips dependencies
    glib2.0-dev \
    libexpat1-dev \
    libtiff5-dev \
    libgsf-1-dev \
    libexif-dev \
    libgif-dev \
    librsvg2-dev \
    libpoppler-glib-dev \
    libtiff-dev \
    libpng-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/


# libvips installation
ARG VIPS_VERSION=8.8.1
ARG VIPS_URL=https://github.com/libvips/libvips/releases/download

RUN wget ${VIPS_URL}/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.gz \
    && tar xf vips-${VIPS_VERSION}.tar.gz \
    && cd vips-${VIPS_VERSION} \
    && ./configure \
    && make \
    && make install \
    && ldconfig \
    && cd - \
    && rm -rf vips-${VIPS_VERSION}.tar.gz \
    && rm -rf vips-${VIPS_VERSION}