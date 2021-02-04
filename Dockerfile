FROM node:lts-buster

SHELL ["/bin/bash", "-ex"]

RUN apt-get update \
    && apt-get -y install screen \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN cd ~ \
    && git clone https://github.com/Tsuk1ko/cq-picsearcher-bot.git \
    && cd cq-picsearcher-bot \
    && cp config.default.jsonc config.jsonc \
    && yarn \
    && cd .. \
    && mkdir gocq/ \
    && mkdir gocq_release/ && cd gocq_release/ \
    && wget https://github.com/Mrs4s/go-cqhttp/releases/download/v0.9.39-fix1/go-cqhttp-v0.9.39-fix1-linux-amd64.tar.gz \
    && tar -xzf $(ls) -C ../gocq/ \