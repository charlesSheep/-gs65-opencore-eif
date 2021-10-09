#!/bin/bash
#设置低电量临界值(百分比)
low_bat_num=8;
#设置关机倒计时间(min)
count_time=1;

#获取外接电源的连接状态con_stat
getPowerConstat(){
    bat_info=$( echo `ioreg -rn AppleSmartBattery | grep ExternalConnected` );
    tmp_str=${bat_info#*ExternalConnected};
    echo ${tmp_str:4:1};
}

#获取电池低电量状态low_bat
getLowBat(){
    bat_info=$( echo `ioreg -rn AppleSmartBattery | grep BatteryData` );
    tmp_str=${bat_info#*StateOfCharge};
    rem_bat_str=${tmp_str:0:5};
    rem_bat=$( echo ${rem_bat_str} | tr -cd "[0-9]" );
    if [ ${rem_bat} -le ${low_bat_num} ]; then
        return 1;
    else
        return 0;   
    fi
}

#取消关机
cancelShutdown(){
    PID=$(ps -eo user,pid,command,ni,uid|grep shutdown | grep -v grep | awk '{print$2}')
    if [ -z "$PID" ]; then
        echo 'no shutdown set';
    else
        echo cancel shutdown ${PID};
        kill ${PID};
    fi
}
#设置关机
setShutdown(){
    count=${count_time};
    PID=$(ps -eo user,pid,command,ni,uid|grep shutdown | grep -v grep | awk '{print$2}')
    if [ -z "$PID" ]; then
        echo 系统将在${count}分钟后关闭;
        shutdown -h +${count};
    else
        echo '关机进程':${PID};
    fi
}

#执行定时关机设定
action(){
    con_stat=`getPowerConstat`;
    getLowBat;
    low_bat=$?;
    if [ ${con_stat} == 'Y' ]; then
        echo '电源已连接,取消关机定时';
        cancelShutdown;
    elif [ ${low_bat} -eq 1 ]; then
        echo '电源未连接,电量低，设置关机定时';
        setShutdown;
    elif [ ${low_bat} -eq 0 ]; then
        echo '电源未连接,电量充足';
    else
        echo '获取的电源参数值有误';
    fi
}

#循环检测
    while true
do
   D=$(date "+%m--%d--%Y %H:%M:%S");
   echo "------$D------"
   #执行定时关机设定
   action;
   #等待5秒
   echo "结束，等待5秒\n"
   sleep 5;
done



