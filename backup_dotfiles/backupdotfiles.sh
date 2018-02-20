#!/bin/sh

#########################################################
# Script Name: backupdotfiles.sh                        #
# Author: Franklin Henriquez (fhenriquez@ebsco.com)     #
# Date: 29 Jan 2018                                     #
# Description: Copies specified dotFiles to a           #
# to a backup directory.                                #
#                                                       #
#################################################i#######

# Sources
source ~/.bash_color_codes

# Variables
home_dir=`echo $HOME` 
date_now=`date +%d%b%Y`
backup_dir="${home_dir}/dotFiles"
dir_date="backup-${date_now}"
files_to_backup='
.aliasrc
.bash_color_codes
.bash_functions
.bash_profile
.bashrc
.ps1_teli_prompt
.vimrc
'
# Main

if [ ! -d "${backup_dir}" ]
then
    echo "${BRed}Directory $backup_dir is not found.${Color_Off}"
else
    mkdir ${backup_dir}/${dir_date}
    for cfiles in `echo $files_to_backup`
    do
        cp ${home_dir}/$cfiles $backup_dir/${dir_date}
    done
fi
