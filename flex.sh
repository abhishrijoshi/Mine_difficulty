#!/bin/bash
 tp=1075
 tog=1
while true;
do
 	difficulty=$(curl -s https://ravencoin.herominers.com/api/stats_address?address=YOUR ADRESS | jq ".workers"  | grep lastJobDifficult | grep -o '[0-9][0-9][0-9][0-9]' |awk '(NR>2)'  |awk '(NR<2)' )
	((tog=1)) && (( $difficulty < $tp )) && tog=0 &&   xsetroot -name " Profitable "  
	((tog=0 )) && (($difficulty >  $tp )) && tog=1 && killall xmrig &&   xsetroot -name " Not Profitable killed it " && sleep 60m && ./start.sh

	sleep 30
done
