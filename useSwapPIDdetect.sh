#!/bin/bash

#for i in `ls /proc`
#do
#	if [ -e /proc/$i/smaps ] # -e yerine -f de olabiir.
#		then
#		grep -H Swap /proc/$i/smaps | awk '( $2 != "0" ) { print }' 
#	fi
#done

#!/bin/bash
#!!!!!! awk -F '|' '{a[$1] += $3} END{print a["smiths"]}' filename.txt
#!!!!!! awk -F '|' '{a[$1] += $3} END{for (i in a) print i, a[i]}' filename.txt
for i in `ls /proc/ | sort -n | grep [0-9]`
do
        if [ -e /proc/$i/smaps ] # -e yerine -f de olabiir.
              then
              grep -H Swap /proc/$i/smaps | awk '( $2 != "0" )  { print }' >> swapKullanan.txt
        fi
done
#cat swapKullanan.txt | tr "/" " " | awk '{print $2 , $4}' | sort -n
cat swapKullanan.txt | sed 's/\//:/g' | cut -d: -f3,6 | awk '{a[$1] += $2} END{for (i in a) print i,a[i],$3} ' | sort -n