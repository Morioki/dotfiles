#!/bin/zsh

# A quick script to bookmark and store project directories.
# Add alias qwe=". qwe.sh" to remove the need for the sh tag

# Casing matters for tags and tag retreival
# Process only returns the first venv found

# TODO Tag cannot contain numbers
# TODO dont move if tag does not exist
# TODO -v flag handling

qwe_BOOKMARK_PATH="$HOME/.qwe/"
qwe_BOOKMARK_FILE="$HOME/.qwe/bookmarks"

###
# Functions
###
function qwe_list_tags()
{
    while IFS="=" read -r key value; do
        case "$key" in
            '#'*) ;; #This is a comment 
            *) # This is a tag
            echo "$key=\"$value\""
        esac
    done < "$qwe_BOOKMARK_FILE"
}

function qwe_read_tags()
{
    while IFS="=" read -r key value; do
        case "$key" in
            '#'*) ;; #This is a comment 
            *) # This is a tag
            eval "$key=\"$value\""
        esac
    done < "$qwe_BOOKMARK_FILE"
}

function qwe_add_tag()
{
    if [ ! -d "$qwe_BOOKMARK_PATH" ] 
    then
        mkdir "$qwe_BOOKMARK_PATH"
    fi
    
    echo "$qwe_new_bookmark_tag=$qwe_new_bookmark_path" >> "$qwe_BOOKMARK_FILE"
}

###
# Main
###
DEF="-h"
p1=$1
p2=$2
qwe_read_tags
# echo $p1
# echo $p2

if [ -n "$p1" ]
# Test whether command-line argument is present (non-empty).
then
  qwe_command=$p1
else  
  qwe_command=$DEF # Default, if not specified on command-line.
fi  

case "$qwe_command" in
    "-a"*)
        if [ -n "$p2" ]
        then
            echo "Adding $p2"
            qwe_new_bookmark_tag="$p2"
            qwe_new_bookmark_path="$PWD"
            qwe_add_tag
        fi;;
    "-d"*)
        if [ -n "$p2" ]
        then
            echo "Deleting $p2 if it exists"
            sed -i "/^$p2=/d" "$qwe_BOOKMARK_FILE"
        fi;;
    "-l"*)
        if [ "$qwe_command" = "-l" ]
        then 
            qwe_list_tags
        fi;;
    "-h"*)
        if [ "$qwe_command" = "-h" ]
        then 
            echo "qwe Folder Bookmark Utility"
            echo "==========================="
            echo "Usage:"
            echo "  qwe    <tag> : Navigate to folder identified by <tag>"
            echo "  qwe -a <tag> : Add a <tag> pointing to current folder"
            echo "  qwe -d <tag> : Remove <tag> record"
            echo "  qwe -h       : Show this help message"
            echo "  qwe -l       : List all known tags"
            echo "  qwe -v <tag> : Navigate to folder identified by <tag> and activate virtual env ending in *envL"
        fi;;
    "-v"*)
        if [ ! -z ${(P)p2} ]
        then
            cd ${(P)p2}
            qwe_venv_path=$(find . -path "*envL/bin" -print | head -n 1)
            if [ -n "$qwe_venv_path" ]
            then 
                source $qwe_venv_path/activate
            else 
                echo "Unable to activate VENV. Does it end with envL"
            fi
        fi
        ;;
    *)
        cd ${(P)qwe_command}

esac
