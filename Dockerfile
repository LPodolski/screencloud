FROM ubuntu:latest

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

RUN apt-get update -y && apt-get install --no-install-recommends -y \
    apt-transport-https \
    ca-certificates \
    gnupg \
    software-properties-common \
    wget
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | apt-key add -
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'

RUN apt-get update -y && apt-get install --no-install-recommends -y git cmake build-essential qtbase5-dev qtbase5-private-dev libqt5svg5-dev libqt5x11extras5-dev qtmultimedia5-dev qttools5-dev libquazip5-dev  libssl-dev python3-dev libpythonqt-qtall-qt5-python3-dev


COPY . /screencloud

RUN true && rm -r /screencloud/build \
&& cd /screencloud \
&& mkdir -p build \
&& cd build \
&& cmake .. \
&& make