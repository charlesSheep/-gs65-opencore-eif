1.将两个文件拷贝到Library/LaunchDaemods/
2.将两个文件的拥有者改为root,确保sh有执行权限,plist权限可参照其它的plist
3.执行launchctl load com...plist的即可,可以到Library/Logs看到low_开头的日志txt
4.可参考install.txt中的命令，最后一行是限制日志大小的，不超过1M
