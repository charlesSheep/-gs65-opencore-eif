# msi-gs65-261n opencore-eif
# 主要参考[errorerrorerror](https://github.com/ErrorErrorError/msi-gs65-gs75-hackintosh)
# 硬件配置
- CPU:i7-8750h
- GPU:IGPU-UHD630|NVIDA-GTX1060
- Memory:16GB(8GB*2)
- Ethernet:KILLER E2500
- WIRELESS:INTEL 9560AC(已更换bcm94360cs2)
- HardDrive:三星pm981(已更换sm961,并添加一块东芝512ssd用于安装win10)
- SCREEN:1920*1080(已更换友达4k显示屏，体验很好)

# 当前系统版本
- BigSur 11.1（目前已经使用了三天了，感觉挺稳了，可以食用了）
![image](https://github.com/charlesSheep/-gs65-opencore-eif/blob/master/IMG.png?raw=true)
- EFI引导版本：官方opencore0.6.4 (引导已配置只扫描macos分区，不使用opencore引导win10,故不使用主题。bios默认第一启动为opencore，需要进win在开机时按f11选系统)

# 驱动情况：
- 除独显GTX1060无法驱动，以及与其直接相联的DP,HDMI接口无法使用外，其余所有设备基本都完美工作，雷电3接口也支持热插拔(测试使用扩展外接显示器)
- 经过长时间的折腾，调试，使用，已无明显硬件的问题影响使用，完全可以作为工作机使用了。

# 存在的问题
- 电池在开机的情况下，完全放电后，导致断电关机，bios设置会被重置。
- 根据一位机友的分享，目前通过转接软排线上了BCM94360CS2，功能上很稳定，WIN下也很稳定，不会有莫名的问题发生，不过2.4G还是和蓝牙有一定干扰，要离得很近才可以
  如果使用第三方博通卡或者原装INTEL网卡(BigSur上没有试过)，要勾选相应驱动
# 安装要注意的问题和说明
- 在系统安装和机型信息调整搞定前，不要登录APPID，可能会因为机器信息的改变导致ID被拉黑，机器信息确定后最好不要再改变了。如果不能登录FACETIME和IMESSAGE,可以在官网上联系客服搞定。
- 机型的选择很关键，可能会影响USB定制，睡眠等很多问题，个人觉得选择最相近的一款 2018年15.1 MACBOOKPRO,CPU是一致的，屏幕大小差不多。 
- 此EFI设置里showpicker取消了，开机后按住ALT键可以进入OC界面
- 显卡设备注入那里最好补上自己的EDID（不过不补可能也不会出现问题，我在换屏之前没有加EDID也没出现异常）
- EFI里放了博通和INTEL的网卡驱动，我现在使用原生卡了，就都取消了。
- ACPI里的SSDT-BATT-R.AML 是电池信息的热补丁，可以配合ACPIBATTERYMANAGER.KEXT使用，还要勾选PACTCH里的几个方法名替换补丁，也可以直接用SMCBATTERYMANAGER.KEXT,效果差不多的，只不过使用补丁的话，电池电量信息更新更快，好像是实时的。
- ACPI里SSDT-IWINHD.AML是在MACOS下屏蔽WIN硬盘的，如果需要使用，要更改里面的PCI的位置信息
- ~~VOODOOPS2CONTROLLER.KEXT最好使用2.1.5的版本，更新版本会在睡眠唤醒后出现一些问题，搞不懂是什么原因。~~
   (经测试，最新的2.2.0版本已经没有异常了，滑动似乎更好一些，不过command和option的键位交换了，需要在系统的修饰键设置里还原下。)
- 热心机友提供了9代GS65的USB定制驱动USBPorts164.kext,机友亲测同时机型需要设置为16.4 9代的mackbookpro
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
      Boot mode = UEFI
      Security

      Secure boot = disabled


     另外，还要：
                1.关闭cfg lock
                2.开启cpu speed shift technology
                3.usb 设置里的 XHCI hand off 开启 
                4.开启雷电接口的设置

                如果是4k屏，还要：
                      1.dvmt allocated设置为64m,最大值设置为max
                      2.above 4g encoding 开启 
                      3.启动参数里加上-igfxmlr(如果是BIGSUR,需要WEG1.4.6以上，需要额外添加-igfxmpc，igfxcflbklt=1需要替换为-igfxblr)
                     
                另外建议：使用XTU测试最佳的cpu电压偏移值，并设置到bios中，会让8750h的发热情况得到极大的改善      
