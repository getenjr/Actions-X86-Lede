#!/bin/bash
#=================================================
# 文件名: diy-part1.sh
# 描述: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# 作者: P3TERX
# Blog: https://p3terx.com
#=================================================
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# Xiaorouji Passwall
sed -i '$a src-git xiaorouji https://github.com/WYC-2020/openwrt-passwall.git' feeds.conf.default

#wsl里面编译前加入下面命令，不包含#
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# argon主题
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon-mod
rm -rf package/lean/luci-theme-argon
rm -rf package/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone -b 18.06 https://github.com/yhl452493373/luci-theme-argon.git package/luci-theme-argon

# neobird主题
rm -rf feeds/luci/themes/luci-theme-neobird
rm -rf package/lean/luci-theme-neobird
rm -rf package/luci-theme-neobird
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
sed -i 's/\/cgi-bin\/luci\/admin\/services\/shadowsocksr/\/cgi-bin\/luci\/admin\/services\/openclash/g' package/luci-theme-neobird/luasrc/view/themes/neobird/header.htm

# 高级设置
#git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced

# NPS内网穿透的客户端NPC
# 删除lede自带npc、nps
# rm -rf feeds/packages/net/nps

# 下载自己的npc
# git clone https://github.com/yhl452493373/npc.git package/npc
# git clone https://github.com/yhl452493373/luci-app-npc.git package/luci-app-npc
#修正npc翻译问题
# mv package/luci-app-npc/po/zh_Hans package/luci-app-npc/po/zh-cn
# OpenClash，此处使用开发版
git clone -b dev --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# frp
#rm -rf feeds/packages/net/frp
#git clone https://github.com/yhl452493373/openwrt-frp.git feeds/packages/net/frp
#FRP_URL=$( curl -sL https://api.github.com/repos/fatedier/frp/releases | grep -P 'download/v[\d.]+/frp_[\d.]+_linux_amd64.tar.gz' | awk -F '"' '{print $4}' | awk 'NR==1{print}' )
#FRP_VERSION=$( echo $FRP_URL | awk -F '/' '{print $8}' | awk '{gsub(/v/,"");print $1}' )
#FRP_HASH=$( curl -sL https://codeload.github.com/fatedier/frp/tar.gz/v$FRP_VERSION | sha256sum | awk -F ' ' '{print $1}' )
# 更新frp源码到最新版本
#sed -i -e 's/^PKG_VERSION.*/PKG_VERSION:='''$FRP_VERSION'''/' feeds/packages/net/frp/Makefile
#sed -i -e 's/^PKG_HASH.*/PKG_HASH:='''$FRP_HASH'''/' feeds/packages/net/frp/Makefile

# FRP穿透
#rm -rf feeds/luci/applications/luci-app-frpc
#git clone https://github.com/yhl452493373/luci-app-frpc.git feeds/luci/applications/luci-app-frpc

# 关机
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff

# 自己固件中需要的包
#git clone https://github.com/yhl452493373/openwrt-packages.git package/my-packages
# 修正定时重启中文语言问题
#mv package/my-packages/luci-app-autoreboot/po/zh-cn package/my-packages/luci-app-autoreboot/po/zh_Hans

# 自己固件中需要的驱动
git clone https://github.com/yhl452493373/openwrt-driver.git package/my-driver
