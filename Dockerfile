FROM alpine:edge

RUN sed -e 's;^#http\(.*\)/edge/community;http\1/edge/community;g' -i /etc/apk/repositories

RUN apk add --no-cache=true --update \
    aria2 \
    bash \
    build-base \
    bzip2-dev \
    chromium \
    chromium-chromedriver \
    coreutils \
    curl \
    docker \
    ffmpeg \
    figlet \
    freetype-dev \
    g++ \
    gcc \
    git \
    jpeg \
    jpeg-dev \
    jq \
    libevent \
    libffi-dev \
    libpq \
    libwebp-dev \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    musl \
    neofetch \
    nodejs \
    openssl \
    openssl-dev \
    postgresql \
    postgresql-client \
    postgresql-dev \
    pv \
    python3 \
    python3-dev \
    readline-dev \
    sqlite \
    sqlite-dev \
    sudo \
    util-linux \
    wget \
    zip \
    zlib-dev

RUN python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools \
    && pip3 install wheel \
    && rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

ADD https://raw.githubusercontent.com/thewhiteharlot/purplealpha/purplealpha/requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
CMD ["python3"]