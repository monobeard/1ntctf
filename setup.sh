#!/bin/bash

whiptail --title "1NTERRUPT CTF" --yesno --defaultno "      Do you want to configure this system as a CTF stage?" 8 70

[ $? -ne 0 ] && exit

TMP=`mktemp`
whiptail --title "1NTERRUPT CTF" --menu "\n    Please choose the stage to configure" 15 50 5 \
       "Stage 1" "" \
       "Stage 2" "" \
       "Stage 3" "" \
       "Stage 4" "" \
       "Stage 5" "" 2>$TMP

read STAGE < $TMP 
rm -rf $TMP

case $STAGE in
  "Stage 1")
    tar Oxzf package.tgz base | bash
    tar Oxzf package.tgz stage1 | bash
  ;;
  "Stage 2")
    tar Oxzf package.tgz base | bash
    tar Oxzf package.tgz stage2 | bash
  ;;
  "Stage 3")
    tar Oxzf package.tgz base | bash
    tar Oxzf package.tgz stage3 | bash
  ;;
  "Stage 4")
    tar Oxzf package.tgz base | bash
    tar Oxzf package.tgz stage4 | bash
  ;;
  "Stage 5")
    tar Oxzf package.tgz base | bash
    tar Oxzf package.tgz stage5 | bash
  ;;
  *)
  ;;
esac

tar Oxzf package.tgz cleanup | bash

whiptail --title "1NTERRUPT CTF" --msgbox "The system will now reboot" 7 30 

reboot

