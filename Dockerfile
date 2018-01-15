FROM library/debian:jessie-slim

LABEL maintainer="Chris Diehl <cultclassik@gmail.com>"

ENV ZEC_URL='https://z.cash/downloads/zcash-1.0.14-linux64.tar.gz'
ENV RPC_USER='root'
ENV RPC_PASS='rootpass'

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    libgomp1 \
    apt-transport-https \
    ca-certificates \
    libcurl3 \
 && wget --no-check-certificate $ZEC_URL \
 && apt-get remove \
    wget \
    apt-transport-https \
    ca-certificates \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/* \
 && tar -xvf ./*.tar.gz -C /usr/local --strip-components 1 \
 && rm -rf ./*.tar.gz

# We have to fetch params and if we don't create a conf file the binary barfs.
RUN zcash-fetch-params \
 && mkdir ~/.zcash \
 && touch ~/.zcash/zcash.conf

VOLUME ~/.zcash

EXPOSE 8232/tcp

ENTRYPOINT [ "zcashd" ]
CMD [ "-server", "-printtoconsole", "-addnode=mainnet.z.cash", "-rpcuser=${RPC_USER}", "-rpcport=${RPC_PORT}" ]