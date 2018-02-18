#!/bin/bash

echo "************************"
echo "* Please select and option:     *"
echo "* 1. Create Group               *"
echo "* Or any key to exit            *"
echo "***********************"

read menu_input

case $menu_input in
1)  echo "==== Group Creation ===="
    echo -n "Please enter a group name: "
    read group_neme
    
    group_test=$(cat /etc/group | awk -F: '{ print $1 }" | grep $group_name)
    
    if [ -z $group_test ] || [ ! $group_test" = "$group_name" ]; then
        /usr/sbin/groupadd "$group_name"
        mkdir /home/$grup_name
        chgrp $group_name /home/$group_name
        chmod 0770 /home/$group_name
        echo "Group and directory added"
    else
        echo "Group already exists!"
    fi
;;
*) echo "EXIT"
esac
