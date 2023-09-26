#!/bin/bash

function create_directory() {
    mkdir -p "$1"
    echo "Directory $1 created."
}

function create_file() {
    touch "$1"
    echo "File $1 created."
}

function list_contents() {
    ls "$1"
}

function show_usage() {
    echo "Usage: $0 OPTION"
    echo -e "\t-d, --directory DIR_NAME\tCreate a directory."
    echo -e "\t-f, --file FILE_NAME\tCreate a file."
    echo -e "\t-l, --list DIR_NAME\tList contents of a directory."
}

function cli() {
    if [ "$#" -eq 0 ]; then
        show_usage
        exit 1
    fi

    while [[ "$#" -gt 0 ]]; do
        key="$1"
        
        case $key in
            -d|--directory)
            create_directory "$2"
            shift # shift past argument
            shift # shift past value
            ;;
            -f|--file)
            create_file "$2"
            shift # shift past argument
            shift # shift past value
            ;;
            -l|--list)
            list_contents "$2"
            shift # shift past argument
            shift # shift past value
            ;;
            *)
            echo "Unknown option: $key"
            show_usage
            exit 1
            ;;
        esac
    done
}
