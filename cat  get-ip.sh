#!bin/bash
#shell-name:ipquery
#date:2020-04-21
#author:copyonline

#筛选2xx/3xx状态，update.*com域名导出到文件
#cat ts_cache_access.log* |grep "TCP.*20.*\|TCP.*30.*"| awk '{print $7}' | grep '^http' | awk -F'/' '{print $3}' | grep update | sort | uniq -c | sort -rn

FILE=./$1
awk '{print $1}' $FILE | while read line
do
#先从log文件里通过域名筛选，把各域名请求ip导出到以域名命名的文件

cat ts_cache_access.log* |grep "TCP.*20.*\|TCP.*30.*"|grep "$line"| awk '{print $3}' > ./com/$line

done
