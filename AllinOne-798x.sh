#!/bin/bash
set -e
cd ~
git clone https://github.com/hanwckf/immortalwrt-mt798x
cd immortalwrt-mt798x
wget https://github.com/xylz0928/Openwrt-Make/raw/main/diy-x86-part1.sh && \
wget https://github.com/xylz0928/Openwrt-Make/raw/main/diy-hanwckf-part2.sh && \
wget https://github.com/xylz0928/Openwrt-Make/raw/main/MakeMenu.360T7_108M.config
bash diy-x86-part1.sh && \
./scripts/feeds update -a && ./scripts/feeds install -a && \
bash diy-hanwckf-part2.sh

cp MakeMenu.360T7_108M.config .config

make download && \
make -j16 V=s
