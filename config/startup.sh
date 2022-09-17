#!/usr/bin/env sh

if [ "$(ls -A /home/jobberuser/.jobs)" ]
then
    cat /home/jobberuser/.jobs > /home/jobberuser/.jobber
fi

/usr/libexec/jobberrunner -u /var/jobber/1000/cmd.sock /home/jobberuser/.jobber