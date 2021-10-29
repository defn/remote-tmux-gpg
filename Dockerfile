ARG IMAGE

FROM $IMAGE

USER root

ENV HOME=/root
ENV USER=root

RUN apk update && apk add curl ca-certificates xz-utils bash

RUN addgroup -g 1000 app
RUN adduser -u 1000 -h /home/app -s /bin/bash -G app -D app
RUN install -d -m 0700 -o app -g app /home/app

USER app
WORKDIR /home/app
ENV HOME=/home/app

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY --chown=app:app etc/nix-install .
RUN bash nix-install –-no-daemon && rm -f nix-install
