#coding=utf-8
#by chianboy007

import json,urllib2,sys
def usage():
    '''usage'''
    print 'Usage: %s %s' %(sys.argv[0],'tokenid')
    sys.exit()
def dingding(tokenid):
    url = "https://oapi.dingtalk.com/robot/send?access_token=" + tokenid
    header = {
        "Content-Type": "application/json",
        "charset": "utf-8"
        }
    data = {
         "msgtype": "text",
            "text": {
                    "content": {
                              "title": "prometheus"
                              }
                  }
         }
    sendData = json.dumps(data)
    request = urllib2.Request(url,data = sendData,headers = header)
    urlopen = urllib2.urlopen(request)
    print urlopen.read()
def main():
    if len(sys.argv) != 2:
        usage()
    tokenid = sys.argv[1]
    dingding(tokenid)
if __name__ == "__main__":
    main()
