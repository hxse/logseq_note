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
auto=false
sleep=10

while getopts 'd:a:s' OPT; do
    case $OPT in
        d) dir="$OPTARG";;
        a) auto="$OPTARG";;
        s) sleep="$OPTARG";;
        h) func;;
        ?) func;;
    esac
done

token=$note_github_token
git remote set-url origin https://hxse:$token@github.com/hxse/logseq_note.git

syncGit()
{
    output=$(git pull --no-rebase)
	echo "---- check remote"

	git add .
	git diff-index --quiet HEAD --
	if [ $? -eq 1 ]
	then
		if [[ $output =~ "Already up to date." ]]
		then
			echo "---- nothing"
		else
			echo "---- pull"
		fi
	else
		if [[ $output =~ "Already up to date." ]]
		then
			echo "---- push"
			git commit -m "auto update"
			git push
		else
			echo "---- merge"
			echo $output
			git commit -m "auto update"

			git pull --no-rebase
			git add .
			git commit -m "auto merge"
			git push
		fi
	fi
}


if [ "$auto" != false ]
then
	while :
	do
		echo "auto run"
		date
        echo ""
		syncGit
        echo ""
        echo "sleep..." $sleep
		sleep $sleep
	done
else
    echo "once run"
    date
    echo ""
	syncGit
fi
