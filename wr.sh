#!/bin/bash

journal_folder=~/journal
# create a folder with today's date if it does not exist
folder=`date +%Y_%m_%d`
mkdir -p $folder
cd $folder
# start vim in insert mode + create file for today's journal.
vim +star `date +%Y%m%d`".md"
# Write an alias into your zshrc or bash_profile so you can get to it from anywhere.
alias journal="cd $journal_folder;./writer.sh"
