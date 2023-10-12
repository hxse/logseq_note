#!/bin/bash

export LANG="en_US.UTF-8"

func() {
    echo "Usage:"
    echo "test.sh [-j S_DIR] [-m D_DIR]"
    echo "Description:"
    echo "S_DIR,the path of source."
    echo "D_DIR,the path of destination."
    exit -1
}
 
dir=./
auto=$false
sleep=10

while getopts 'd:a:s' OPT; do
    case $OPT in
        d) dir="$OPTARG";;
        a) auto="$OPTARG";;
        s) sleep="true";;
        h) func;;
        ?) func;;
    esac
done

syncGit()
{
    output=$(git pull --no-rebase)
    echo "$output"
	echo "---- check remote"


	if [[ $output =~ "Already up to date." ]]
	then
		echo "包含"
	else
		echo "不包含"
	fi
}


if [[ $auto != $false ]]
then
	echo "auto..."
else
	echo "once..."
	syncGit
fi
