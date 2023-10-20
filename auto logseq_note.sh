#!/bin/bash

export LANG="en_US.UTF-8"

if [ -z "$1" ]
then
    sleep=60
else
    sleep=$1
fi

bash "./once logseq_note.sh" -a true -s $sleep
