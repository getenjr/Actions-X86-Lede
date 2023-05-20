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
#sed -i '$a src-git xiaorouji https://github.com/WYC-2020/openwrt-passwall.git' feeds.conf.default

# Argon主题
# lede的argon和openwrt的不通用，不能下载自己修改后的
#git clone https://github.com/yhl452493373/luci-theme-argon.git package/luci-theme-argon

# 高级设置
#git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced

# NPS内网穿透的客户端NPC
# lede自带npc，这里就不需要再下载了
#git clone https://github.com/yhl452493373/npc.git package/npc
git clone https://github.com/yhl452493373/luci-app-npc.git package/luci-app-npc
#修正npc翻译问题
mv package/luci-app-npc/po/zh_Hans package/luci-app-npc/po/zh-cn

# OpenClash，此处使用开发版
git clone -b dev --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 关机
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff

# 自己固件中需要的包
#git clone https://github.com/yhl452493373/openwrt-packages.git package/my-packages
# 修正定时重启中文语言问题
#mv package/my-packages/luci-app-autoreboot/po/zh-cn package/my-packages/luci-app-autoreboot/po/zh_Hans
