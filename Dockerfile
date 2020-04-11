FROM ubuntu:latest

RUN apt-get update -y && apt-get install --no-install-recommends -y git build-essential cmake qtbase5-dev qtbase5-private-dev libqt5svg5-dev libqt5x11extras5-dev qtmultimedia5-dev qttools5-dev libquazip5-dev  libssl-dev python3-dev libpythonqt-qtall-qt5-python3-dev

COPY . /screencloud

RUN true && rm -r /screencloud/build \
&& cd /screencloud \
&& mkdir -p build \
&& cd build \
&& cmake .. -DQUAZIP_INCLUDE_DIR=/screencloud/build/quazip-src/quazip \
&& make