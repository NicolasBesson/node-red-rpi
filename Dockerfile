FROM nodered/node-red-docker:rpi
MAINTAINER Nicolas Besson <billounet@gmail.com>
LABEL version="1.0" \
      description="Node-RED image for Raspberry Pi with the Bluetooth node installed"

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
  bluetooth \
  bluez \
  libbluetooth-dev \
  libudev-dev \
  build-essential bluez-tools

RUN usermod -a -G bluetooth node-red && \
    setcap cap_net_raw+eip /usr/local/bin/node

USER node-red

RUN npm install --quiet \
    node-red-contrib-generic-ble 

EXPOSE 1880
