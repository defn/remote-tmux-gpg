ARG IMAGE

FROM $IMAGE

USER root

ENV HOME=/root
ENV USER=root
ENV DEBIAN_FRONTEND=noninteractive
ENV container docker

RUN dpkg-divert --local --rename --add /sbin/udevadm && ln -s /bin/true /sbin/udevadm

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        curl  \
    && rm -f /usr/bin/gs

RUN groupadd -g 1000 app
RUN useradd -u 1000 -d /home/app -s /bin/bash -g app -M app
RUN usermod app -a -G sudo
RUN install -d -m 0700 -o app -g app /home/app

USER app
WORKDIR /home/app
ENV HOME=/home/app

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN curl -sSL -o nix-install https://nixos.org/nix/install && bash nix-install –no-daemon && rm -f nix-install
