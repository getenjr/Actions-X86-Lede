# Actions-X86-Lede
an action to build lede


#### 每周六早上自动编译Lede最新代码。编译后系统主题为argon-mod，去除了lede默认选中的软件，同时nginx去除http自动转https。内核为`6.1.x`
+ luci-app-openclash(科学上网)
+ luci-app-npc(内网穿透)
+ luci-app-ddns(动态DNS)
+ luci-app-upnp(即插即用)
+ luci-app-samba4(网络共享)
+ luci-app-autoreboot(定时重启)
+ luci-app-poweroff(关机)
+ luci-app-argon(适用于lede的argon主题，lede仓库中的argon-mod)
+ luci-app-firewall(防火墙)
+ luci-app-nlbw(网络监控)
+ luci-app-qos(服务质量)
+ luci-app-arpbind(IP/MAC 绑定)

## 本系统不包含任何无线网卡相关功能，防火墙为Firewall，不是Firewall4。这两项选择后lede编译不通过。

## 默认密码：`password`
