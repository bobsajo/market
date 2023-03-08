import urllib.request
import time
import pandas as pd
import csv
 
f = open('sangpum_encoding.csv', 'r', encoding='ansi')
rdr = csv.reader(f)

first=0

for line in rdr:
    
    if first==0:
        first=first+1
        continue

    print(line[2])
    
    img_num=line[0]
    img_name=line[1]
    img_link=line[2]

    # 다운받을 이미지 url
    #url = "https://img-cf.kurly.com/cdn-cgi/image/quality=85,width=676/shop/data/goods/1648206780555l0.jpeg"

    # time check
    start = time.time()

    # 이미지 요청 및 다운로드
    urllib.request.urlretrieve(img_link, "image/"+img_num+".jpg")

    # 이미지 다운로드 시간 체크
    #print(time.time() - start)

    # 저장 된 이미지 확인
    #img = Image.open("test.jpg")

f.close()
