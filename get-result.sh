#!bin/bash
#shell-name:ipquery
#date:2020-04-21
#author:copyonline


FILE=./$1
awk '{print $1}' $FILE | while read line
do

/usr/bin/python mmdb.py  $line

#根据ip归属地的国家字段，统计技术并排序
wc -l $line-result.txt >> ./final-result.txt
cat $line-result.txt|awk  'BEGIN{FS=","}{print $13}' |sort | uniq -c | sort -rn >> ./final-result.txt

done
