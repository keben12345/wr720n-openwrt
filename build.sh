#!/bin/bash

set -e

git clone https://github.com/openwrt/openwrt.git -b v19.07.10

cd openwrt

cp ../.config .config

./scripts/feeds update -a
./scripts/feeds install -a

make defconfig

make download -j8

make -j$(nproc)