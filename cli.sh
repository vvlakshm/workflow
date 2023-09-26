#!/bin/bash

function f1() {
    mkdir -p "$1"
    echo "$1 created."
}

function f2() {
    touch "$1"
    echo "$1 created."
}

function f3() {
    ls "$1"
}

function cli() {
    if [ "$#" -eq 0 ]; then
        exit 1
    fi

    while [[ "$#" -gt 0 ]]; do
        key="$1"
        
        case $key in
            -d|--dir)
            f1 "$2"
            shift
            shift
            ;;
            -f|--file)
            f2 "$2"
            shift
            shift
            ;;
            -l|--list)
            f3 "$2"
            shift
            shift
            ;;
            *)
            exit 1
            ;;
        esac
    done
}
