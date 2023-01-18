FROM alpine:latest

RUN apk update \
&& apk add --no-cache --virtual .build-deps g++ libffi-dev openssl-dev \
&& apk add python3 python3-dev py-pip go git \
&& pip3 install --upgrade pip setuptools

VOLUME /app/web

WORKDIR /app

COPY . .
RUN pip3 install .
RUN apk del .build-deps

ENTRYPOINT [ "/usr/bin/vscode-dl" ]
