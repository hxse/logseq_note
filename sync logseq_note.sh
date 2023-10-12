#!/bin/bash
 
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
 
echo $dir
echo $auto
echo $sleep


