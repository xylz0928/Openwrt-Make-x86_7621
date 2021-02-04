#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#


# 修复核心及添加温度显示
# sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

sed -i 's/invalid/# invalid/g' package/network/services/samba36/files/smb.conf.template
echo "DISTRIB_REVISION='S$(TZ=UTC-8 date +%Y.%m.%d) xylz0928 Products'" > ./package/base-files/files/etc/openwrt_release1

# Modify index 
#sed -i 's|https://github.com/sirpdboy/openwrt/actions|https://github.com/xylz0928/Openwrt-Make-x86_7621/actions|g' ./package/diy/autocore/files/x86/index.htm
#sed -i 's|https://github.com/sirpdboy/openwrt18.06/issues|https://github.com/xylz0928/Openwrt-Make-x86_7621/issues|g' ./package/diy/autocore/files/x86/index.htm
#sed -i 's|固件TG聊天群|作者网站首页|g' ./package/diy/autocore/files/x86/index.htm
#sed -i 's|https://t.me/joinchat/AAAAAEpRF88NfOK5vBXGBQ|https://7ze.top|g' ./package/diy/autocore/files/x86/index.htm

# Change default theme
sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci/Makefile

# Add ServerChan
# git clone https://github.com/tty228/luci-app-serverchan.git feeds/luci/applications/luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

# Add Onliner
# git clone https://github.com/rufengsuixing/luci-app-onliner.git feeds/luci/applications/luci-app-onliner
git clone https://github.com/rufengsuixing/luci-app-onliner.git package/luci-app-onliner

# Add OpenAppFilter
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter


# Add ServerChan-DINGDING
git clone https://github.com/zzsj0928/luci-app-serverchand package/luci-app-serverchand

# Add Hello World
# svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/diy/luci-app-vssr
# svn co https://github.com/siropboy/luci-app-vssr-plus/trunk/luci-app-vssr-plus package/new/luci-app-vssr-plus

git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
#git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr

# Add Passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
rm -rf ./package/lean/dns2socks
rm -rf ./package/lean/ipt2socks
rm -rf ./package/lean/kcptun
rm -rf ./package/lean/microsocks
rm -rf ./package/lean/shadowsocksr-libev
rm -rf ./package/lean/simple-obfs
rm -rf ./package/lean/tcping
rm -rf ./package/lean/trojan
rm -rf ./package/lean/v2ray
rm -rf ./package/lean/v2ray-plugin
rm -rf ./package/openwrt-passwall/naiveproxy
rm -rf ./package/openwrt-passwall/tcping
rm -rf ./package/openwrt-passwall/xray-core

# Add OpenClash
git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash

# Add ADGuardHome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-adguardhome ./package/luci-app-adguardhome
chmod -R 755 ./package/luci-app-adguardhome/*

# Add KoolProxyR Plus+
# git clone https://github.com/jefferymvp/luci-app-koolproxyR package/luci-app-koolproxyR
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-koolproxyR ./package/luci-app-koolproxyR
chmod -R 755 ./package/luci-app-koolproxyR/*

# Add luci-app-socat
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat ./package/luci-app-socat
chmod -R 755 ./package/luci-app-socat/*

# Add SmartDNS
# rm -rf ./feeds/packages/net/smartdns
# svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns ./package/luci-app-smartdns
# svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./package/smartdns
# chmod -R 755 ./package/smartdns
# chmod -R 755 ./package/luci-app-smartdns

# Add Poweroff
git clone https://github.com/xylz0928/luci-app-shutdown package/luci-app-shutdown
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# chmod -R 755 ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# chmod -R 755 ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm

# Fix Multi-use on one physical port 
# 修复 5.4.68-5.4.69内核 于 MIPS 架构 单线复用BUG
# 取自 @AmadeusGhost， 原更新内容为 generic: limit commit "ramips/mediatek: improve GRO performance, fix PPE packet parsing" to mediatek target only
# wget https://github.com/AmadeusGhost/lede/commit/7a49d2cf99bd59506bbd9239e0bde81a61f93c40.patch
# git apply 7a49d2cf99bd59506bbd9239e0bde81a61f93c40.patch
