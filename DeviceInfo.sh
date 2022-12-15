#!/usr/bin/bash

enumUsers()
{

userList=$(cut -f1 -d: /etc/passwd)
for userName in $userList;
    do printf '%s ' $userName; crontab -u $userName -l;
done

declare -A loginInfo=( [remote]=`lastlog` [failed]=`faillog -a` )
for val in "${loginInfo[@]}";
    do echo -e "\n"; echo $val;
done

printf '\n\n'
}

systemInfo()
{

#systemCmds=('uname -a', 'uptime', 'timedatectl', 'mount', 'echo $PATH')
declare -A systemData=( [hostInfo]=`uname -a` [runTime]=`uptime` [clock]=`timedatectl` [mounts]=`mount -a` [path]=`echo $PATH` )
for val in "${systemData[@]}";
    do echo $val;
done

}

enumUsers
systemInfo
