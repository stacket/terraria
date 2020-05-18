#!/bin/sh
secureFlag=""
if [ "$secure" == "true" ]
then
    secureFlag = "-secure"
fi

steamFlag=""
if [ "$steam" == "true" ]
then
    steamFlag = "-steam"
fi

disableannouncementboxFlag=""
if [ "$disableannouncementbox" == "true" ]
then
    disableannouncementboxFlag = "-disableannouncementbox "
fi

seedFlag=""
if [ "$seed" != "" ]
then
    seedFlag = "-seed $seed"
fi

passwordFlag=""
if [ "$password" != "" ]
then
    passwordFlag = "-password $password"
fi

/run.sh /terraria/TerrariaServer -x64 -config /app/serverconfig.txt