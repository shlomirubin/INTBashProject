#! /bin/bash

# this greets the user once login is perform
echo "Hello $USER"

# create environment variable
export COURSE_ID=__REPO_NAME__

# Check if the .token file exists
if [ -f ".token" ]; then
    # Get the octal representation of the file permissions
    permissions=$(stat -c "%a" ".token")

    # Check if permissions are different from 600
    if [ "$permissions" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi

    if [ "$permissions" == "600" ]; then
        echo ".token file has too good permissions"
    fi
fi

# Change umask default setting of user
umask 006

# create directory named usercommands and add it's to PATH
export PATH=$PATH:/home/$USER/usercommands

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
