# msi-gs65-261n opencore-eif
# 主要参考[errorerrorerror](https://github.com/ErrorErrorError/msi-gs65-gs75-hackintosh)
# 硬件配置
- CPU:i7-8750h
- GPU:IGPU-UHD630|NVIDA-GTX1060
- Memory:16GB(8GB*2)
- Ethernet:KILLER E2500
- WIRELESS:INTEL 9560AC(已更换dw1820a)
- HardDrive:三星pm981(已更换sm961,并添加一块东芝512ssd用于安装win10)
- SCREEN:1920*1080(已更换友达4k显示屏，体验很好)

# 当前系统版本
- Catalina 10.15.6
- EFI引导版本：官方opencore0.6.1 (引导已配置只扫描macos分区，不使用opencore引导win10,故不使用主题。bios默认第一启动为opencore，需要进win在开机时按f11选系统)

# 驱动情况：
- 除独显GTX1060无法驱动，以及与其直接相联的DP,HDMI接口无法使用外，其余所有设备基本都完美工作，雷电3接口也支持热插拔(测试使用扩展外接显示器)
- 经过长时间的折腾，调试，使用，已无明显硬件的问题影响使用，完全可以作为工作机使用了。

# 存在的问题
- 电池未能显示是否处于临界状态，目前不知道如设置低电量自动休眠
- 电池在开机的情况下，完全放电后，导致断电关机，bios设置会被重置。
- 无法在wifi界面直接点击连接iphone热点，显示设备可能未开热点或未处于范围内，不确定是否是系统设置或无线网卡的问题。
- dw1820a 在连接2.4g wifi的情况下，会与蓝牙产生干扰，导致耳机声音不畅；使用5g wifi则没有此问题，蓝牙表线非常稳定(win10下一切正常)

# 推荐的小工具
- 键盘灯可以使用 https://github.com/ErrorErrorError/SSKeyboardHue 这个来控制，软件退出的时候会报错，不过不影响使用。
- 蓝牙设备靠近解锁，远离锁定小工具BLELock:https://github.com/ts1/BLEUnlock (亲测非常实用)

# 整体使用体验
- 目前稳定使用一段时间了，除了独显无法驱动，基本没有什么挑锡了，随时开盖用合盖放一边，就像白果一样,感觉睡眠比win还要稳定好用，而且配合BLEunlock,只要手机在身边，开盖就直接用了，不用输密码，很舒适。以前win睡眠放包里无故唤醒，那家伙烫得。mac功耗控制也很好，一般使用，频率在0.8-2.0之间，用个5小时还是完全可以的，相对众多的标压u的本，已经不错了。
- 由于更换了4k屏，使用体验应该和xps系列的黑果使用体验相媲美了，而且相比于xps没有多余的不可驱动的硬件，像指纹，读卡器什么的，对强迫症友好，哈哈。。。。 如果打算认真使用黑果，还是非常推荐换4k屏，换屏后动画可能会有点不流畅，最好重装下系统，之前还以为是4k屏的锅，自从重装了10.15.6之后，流畅多了，而且会自动适应屏幕，不用开启hidpi,会默认缩放到1080p，显示效果非常棒。


# bios设置：  
      Advanced
      Sata mode = AHCI (if it's on raid create a new issue on Github and don't continue with this guide)
      VT-d = Disabled
      Boot
      Fastboot = disabled
      Boot mode = UEFI with CSM
      Security

      Secure boot = disabled


     另外，还要：
                1.关闭cfg lock
                2.开启cpu speed shift technology
                3.usb 设置里的 XHCI hand off 开启 

                如果是4k屏，还要：
                      1.dvmt allocated设置为64m,最大值设置为max
                      2.above 4g encoding 开启 
                      3.启动参数里加上-igfxmlr
                     
                另外建议：使用XTU测试最佳的cpu电压偏移值，并设置到bios中，会让8750h的发热情况得到极大的改善      
