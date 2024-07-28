#! /bin/bash

# this greets the user once login is perform
echo "Hello $(whoami)"

# create environment variable
export COURSE_ID=__REPO_NAME__

# Change umask default setting of user
umask 006

FILE="/home/$USER/.token"
if [ -f "$FILE" ]; then
    if [ $(stat -c %a "$FILE") -ne 600 ]; then
    echo "Warning: .token file has too open permissions"
    fi
fi



# create directory named usercommands and add it's to PATH
export PATH="/home/$USER/usercommands:$PATH"

# prints date in ISO 8601 format, UTC timezone.
date -u +"%Y-%m-%dT%H:%M:%SZ"

# create an alias that prints all file with extension .txt
shopt -s expand_aliases
# now make and use aliases
alias ltxt="ls -la *.txt"
touch file.txt
ltxt

# create a directory named tmp, creates 3 files in it, then removes all files inside without remove directory itself
mkdir -p tmp
ls -la | grep tmp
cd tmp
touch test1 test2 test3
rm -rf *

# the following kill a process that bound to port 8080
fuser -k 8080/tcp
