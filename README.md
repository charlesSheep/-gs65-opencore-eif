# -gs65-opencore-eif
参考errorerrorerror


自己的机型是8代1060版本的,同1070的版本的主板应该是基本一致的；听说9代的版本主板设计有所不同,不知道是否会有问题。
      本人也是拆腾黑苹果才2个多月，也不懂的dsdt的修改和编译，只能是使用大神们的各种解决方案一个个试验的,这款机型应该难度不高，属于比较典型的那种，所以可以搜到很多基本做得差不多的efi，我参考的 https://github.com/ErrorErrorError/msi-gs65-gs75-hackintosh ，使用基本没问题，只是亮度保存有些问题，后来翻帖才知道和nvram和als0有关，最后功夫不负有心人，终于让我翻到了相关帖子，开启了原生的nvram,补上了als0设备。

      然后知道了有opencore这个引导，而且将来可能会取代clover，就参考黑果小兵的 https://blog.daliansky.net/From-Clover-To-OpenCore.html 转换到了OC，意外解决了clover引导win10触摸板异常的问题，而且启动项可以在设置里的启动磁盘里设置。
除了雷电接口没有测试过(可以扩展hdmi使用外接屏或其它，因为自带的hdmi和dp是直接接到独显上的，除非能驱动独显否则只能用雷电接口，不过我也没这个需求) 我开启了模拟苹果快捷键，按住alt可以进入启动项选择界面。

      本人使用的opencore的ndk版本,之前也是用的原版，后来发现oc把机型都注到win10里去了，搞得龙盾都没法设置，开发者可能是想把电脑完全仿mac，个人觉得这个并没有必要，毕竟它原本就是个pc，在win下还是恢复它本来样子吧。

      键盘灯可以使用 https://github.com/ErrorErrorError/SSKeyboardHue 这个来控制，软件退出的时候会报错，不过不影响使用。

      说明：机型要使用macbookpro 15.1,其它的机器参数，mlb,rom,序列号等要设置成自己的。最好是注入自己屏幕的edid(在显卡设备里面添加这个参数：AAPL00,override-no-connect，值就是在win下提取的edid),特别是更换了屏幕，不然有可能会偶尔花屏，如果和我一样更换了4k屏,还要加上启动参数-igfxmlr。驱动已经更新到当前最新版本，系统直接升到10.15.5是没有问题的。

      存在小问题：从win10直接重新启动到mac时可能会丢失声卡，据说是win10重新启动时没有重置hda的问题，这个我也不懂，尽量还是关机，冷起动吧。

      体验：这款机器的黑果使用体验还是不错的，和xps比起来，就是做工有点差(外观还是可以的)，hdmi没法用(听说安装了10.13.6驱动独显后可以用)。像续航，睡眠，手势什么的都很完美，我现在已经更换4k屏了，但亲测浏览网页和文本都可以达到6个小时以上，如果只是看文档，7个多小时都可以，轻度使用的情况下，整个机器都是凉凉的(除了底座是温热的)。如果使用的是1080p的屏幕，各种动画都是丝般流畅；如果是4k，基本还是流畅的，只有在lanuchpad中打开有很多项目的文件夹时会有明显掉帧，后来听说连同机型白果都会在这里掉帧，基本可以确定是uhd630的锅了。

      bios设置：         
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
