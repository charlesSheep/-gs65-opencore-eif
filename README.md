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
- Monterey Beta9
![image](https://github.com/charlesSheep/-gs65-opencore-eif/blob/master/截屏2021-10-09%20下午10.48.46.png?raw=true)
- EFI引导版本：官方opencore0.6.9 (引导已配置只扫描macos分区，不使用opencore引导win10,故不使用主题。bios默认第一启动为opencore，需要进win在开机时按f11选系统)

# 驱动情况：
- 除独显GTX1060无法驱动，以及与其直接相联的DP,HDMI接口无法使用外，其余所有设备基本都完美工作，雷电3接口也支持热插拔(测试使用扩展外接显示器)
- 经过长时间的折腾，调试，使用，已无明显硬件的问题影响使用，完全可以作为工作机使用了。

# 存在的问题
- ~~电池在开机的情况下，完全放电后，导致断电关机，bios设置会被重置。~~（通过添加低电量关机脚本解决）
- 添加低电量自动关机脚本，防止在低电量时用尽电池，导致BIOS设置被重置,亲测有效，电量临界值可以脚本中更改，使用可参考install.txt

# 安装要注意的问题和说明
- *******此EFI设置里showpicker取消了，开机后按住ALT键可以进入OC界面*********
- 在系统安装和机型信息调整搞定前，不要登录APPID，可能会因为机器信息的改变导致ID被拉黑，机器信息确定后最好不要再改变了。如果不能登录FACETIME和IMESSAGE,可以在官网上联系客服搞定。
- 机型的选择很关键，可能会影响USB定制，睡眠等很多问题，个人觉得选择最相近的一款 2018年15.1 MACBOOKPRO,9代选择16.4的，
- 显卡设备注入那里最好补上自己的EDID（不过不补可能也不会出现问题，我在换屏之前没有加EDID也没出现异常),ig-platform-id也要注意下，我的8750H使用3EA50009没问题,如果是9代的可能不一样,具体可以百度查询到。
- EFI里只放了博通网卡驱动，但没有勾选。(如果不追求极致网速，推荐使用完全免驱的卡，如通用版的94325z或者拆机的94360cs2，互联互通功能上没有一点BUG，如果追求网速或者蓝牙5.0，可以上intel的卡，有大神已经搞定了驱动，听说网速已经很棒了)
- ACPI里SSDT-IWINHD.AML是在MACOS下屏蔽WIN硬盘的，如果需要使用，要更改里面的PCI的位置信息
- ~~VOODOOPS2CONTROLLER.KEXT最好使用2.1.5的版本，更新版本会在睡眠唤醒后出现一些问题，搞不懂是什么原因。~~
   (经测试，最新的2.2.0版本已经没有异常了，滑动似乎更好一些，不过command和option的键位交换了，需要在系统的修饰键设置里还原下,建议不要经常升级这个驱
   动，有的版本会在睡眠唤醒时出问题，不清楚是不是编译的原因，我提上来的版本是长时间使用验证没出问题的)
- 热心机友提供了9代GS65的USB定制驱动USBPorts164.kext,机友亲测同时机型需要设置为16.4 9代的mackbookpro
- 根据一位机友的分享，目前通过转接软排线上了BCM94360CS2，功能上很稳定，WIN下也很稳定，不会有莫名的问题发生，不过2.4G还是和蓝牙有一定干扰，要离得很近才可以
  如果追求完美苹果功能又不追求极致的网速，强烈建议上拆机卡，不用额外地改装机器，可以很完美的安装，以下是安装的图片：
 ![image](https://github.com/charlesSheep/-gs65-opencore-eif/raw/master/安装.png)
 
# 推荐的小工具
- 键盘灯可以使用 https://github.com/ErrorErrorError/SSKeyboardHue 这个来控制，软件退出的时候会报错，不过不影响使用。
- 蓝牙设备靠近解锁，远离锁定小工具BLELock:https://github.com/ts1/BLEUnlock (亲测非常实用)
- 推荐使用OCAuxiliaryTools升级OC，简直不要太舒服，终于不用再对着新文件一个个对比键值了,而且还可以排错

# 整体使用体验
- 目前稳定使用一段时间了，除了独显无法驱动，基本没有什么挑锡了，随时开盖用合盖放一边，就像白果一样,感觉睡眠比win还要稳定好用，而且配合BLEunlock,只要手机在身边，开盖就直接用了，不用输密码，很舒适。以前win睡眠放包里无故唤醒，那家伙烫得。mac功耗控制也很好，一般使用，频率在0.8-2.0之间，用个5小时还是完全可以的，相对众多的标压u的本，已经不错了。
- 由于更换了4k屏，使用体验应该和xps系列的黑果使用体验相媲美了，开启HDPI，多次尝试，使用1504*846的缩放比例最合适，字体大小适中，而且非常流畅，即使打开launch里项目最多的那个文件夹，也基本不掉帧(使用1080P的缩放是绝对会掉帧的)
  各种场景也很顺滑(之前一直使用1080P的缩放，整体感觉使用起来感觉很吃力，总不如WIN下舒服，后来发现WIN下默认缩放250%，并不是200%，才想到黑果这边也
  可以调一下，瞬间舒服了，简直比WIN下的动画还流畅)

# 添加风扇控制驱动，资源来自：
- http://bbs.pcbeta.com/viewthread-1842256-1-1.html
- https://github.com/lgs3137/MSIFanControl
- 亲测使用正常，与WIN下龙盾的风扇高级设置项的效果一样(~~但不能设置GPU风扇~~)。
- 发现SSDT中有关于GPU风扇设置的项，只不过作者没有在应用中使用，应该是显卡未开启的情况下不能通过温度控制，但可以设置一个固定的值，这是非常有用的，
  显卡风扇完全不转时，使用时间一长，非常容易积热，即使使用的强度并不高，温度也会逐渐变得很高，想放在腿上看看文档都难受，我现在SSDT里设置了固定的35%转速，平时使用也感受不
  到什么噪音，但体验真是好多了，加上Montery似乎对能耗优化了不少，放在腿上看视频什么的，与WIN下基本没区别了(WIN下使用龙盾开了默认转速),底部一直温热
  ，不像之前使用时间稍微长点就发烫了。
- 由于是shell的应用(放置在fancontrol文件夹下)，需要在设置-用户与群组-登录项下添加启动脚本，使用可参考fancontrol文件夹fanset.sh里的内容
  强烈推荐使用EventScript这个软件，可以使用computerwakes,EventScriptLaunched这两个事件来触发脚本fanset.sh，再设置该软件开机启动，这样做是最简单的，可
  在睡眠唤醒，开机时总是触发设置。 



# bios设置：  
      Advanced
      Sata mode = AHCI (if it's on raid create a new issue on Github and don't continue with this guide)
      VT-d = Disabled
      Boot
      Fastboot = disabled
      Boot mode = UEFI
      Security

      Secure boot = disabled(必须的)


     另外，还要：
                1.关闭cfg lock(实测这是必须的)
                2.cpu speed shift technology(非必须，开启似乎响应更快些,建议还是开启)
                3.usb 设置里的 XHCI hand off 开启（必须的，默认应该是开启的） 
                4.开启雷电接口的设置(不用应该可以不开)

                如果是4k屏，还要
                      1.启动参数里加上-igfxmlr(如果是BIGSUR,需要WEG1.4.6以上，需要额外添加-igfxmpc，igfxcflbklt=1需要替换为-igfxblr)
                     
                另外建议：使用XTU测试最佳的cpu电压偏移值，并设置到bios中，会让8750h的发热情况得到极大的改善      
