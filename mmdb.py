#!/usr/bin/python
#-- coding:UTF-8 --
import maxminddb
import sys,os
import json
import sys

reload(sys)
sys.setdefaultencoding( "utf-8" )



a=sys.argv[1]
def main():

    with open(a,"r") as f:
        for line in f.readlines():
            try:
                reader = maxminddb.open_database('/home/caifeng/ip.mndb')
                #strip() 方法用于移除字符串头尾指定的字符（默认为空格或换行符）或字符序列
                result1 = reader.get(line.strip('\n'))
                result = json.dumps(result1).decode('unicode_escape')
                reader.close()
            except Exception as e:
                print(e)
            else:
                with open(a+'-result.txt','a+') as r:
                    r.write(line.strip('\n') + ' ')
                    r.write(result + '\n')

if __name__ == '__main__':
    main()
