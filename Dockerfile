FROM library/debian:jessie-slim

LABEL maintainer="Chris Diehl <cultclassik@gmail.com>"

ENV ZEC_URL='https://z.cash/downloads/zcash-1.0.13-linux64.tar.gz'
ENV RPC_USER='root'
ENV RPC_PASS='rootpass'

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    libgomp1 \
    apt-transport-https \
    ca-certificates \
    libcurl3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget --no-check-certificate $ZEC_URL

RUN tar -xvf ./*.tar.gz -C /usr/local --strip-components 1 &&\
    rm -rf ./*.tar.gz

RUN zcash-fetch-params

RUN mkdir ~/.zcash &&\
    echo "rpcuser=${RPC_USER}" >> ~/.zcash/zcash.conf &&\
    echo "rpcpassword=${RPC_PWD}" >> ~/.zcash/zcash.conf &&\
    echo "mainnet=1" >> ~/.zcash/zcash.conf &&\
    echo "addnode=mainnet.z.cash" >> ~/.zcash/zcash.conf

EXPOSE 8232/tcp

CMD [ "zcashd" ]