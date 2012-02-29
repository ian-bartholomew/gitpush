#!/bin/bash
set -e

RESET="\033[0m"
REDCOLOR="\033[31m"
GREENCOLOR="\033[32m"

current_branch=`git branch | awk '/\*/ {print $2}'`

clear
echo -e $GREENCOLOR"--------------------------------------- STARTING PUSH -------------------------------------------"$RESET

git checkout master && git pull origin master && git checkout $current_branch && git rebase master && git checkout master && git pull origin master && git merge $current_branch && git push origin master && git checkout $current_branch || {
	echo -e $REDCOLOR"----------------------------------- PUSH FAILED (SEE ERRORS)-------------------------------------"$RESET;
	echo -e $REDCOLOR"---- Most likely, you will just need to run 'git mergetool' and then 'git rebase --continue' ----"$RESET;
	exit 1;
}

echo -e $GREENCOLOR"--------------------------------- PUSH AND REBASE SUCCESSFUL ------------------------------------"$RESET
