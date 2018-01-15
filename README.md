# zcash-docker-node [![Build Status](https://travis-ci.org/CryptoJunkies/zcash-docker-node.svg?branch=master)](https://travis-ci.org/CryptoJunkies/zcash-docker-node)
[Image on Docker Hub](https://hub.docker.com/r/cryptojunkies/zcash-node/)

Dockerfile to build cryptojunkies/zcash-node container.

Uses the official binaries from Zcash.

This container will run a node, you must use a client to connect to it.

## Pre-requisites

Requires a working installation of Docker CE or EE.

## Installation

docker build -t cryptojunkies/zcash-node .

## Usage

If you wish to supply a config file, you can do so by adding a volume at runtime.
Either map a folder to /root/.zcash or file to /root/.zcash/zcash.conf.

This container uses the standard RPC port 8323/tcp.
The default user and pass are root and rootpass.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

TODO: Write credits

## License

TODO: Write license