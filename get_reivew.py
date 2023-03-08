from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import pandas as pd
import time
from urllib import parse

# 크롬드라이버 가져오기
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
# 마켓컬리 베스트 상품 페이지
url = 'https://www.kurly.com/collections/market-best'
driver.get(url)
driver.implicitly_wait(time_to_wait=5)

# 상품 div 가져옴
elements = driver.find_elements(By.CLASS_NAME, 'css-1xyd46f')
item_list = []
rivew_list=[]
# 크롤링 딜레이시간, 에러가 날 경우 count+=1 헤서 딜레이를 늘려줄것
count = 2
error = []
# 상품의 개수만큼 반복
#len(elements)
for i in range(5):
# 페이지를 이동하면 driver의 elements를 다시 받아줘야한다.
# 상품 상세보기로 이동했다가 다시 돌아오면 elements사용에 오류가 났다.
# 그래서 반복문을 시작할 때 elemets를 새로 받아준다.
    elements = driver.find_elements(By.CLASS_NAME, 'css-1xyd46f')
    element = elements[i]
    #print(element)

	# 제품 이름, 이미지 URL 가져오기
    item_name = element.find_element(By.CLASS_NAME, 'e1c07x488').text
    #print(item_name)

# 상품 클릭
    element.click()
    time.sleep(count)

    try:
    #id: review의 class: e36z05c0의 tag_nae: p => 리뷰 내용
        rivew = driver.find_elements(By.ID, 'review')[0]
        rivew = rivew.find_elements(By.CLASS_NAME, 'e36z05c0')

        for r in rivew:
            rivew_text = r.find_element(By.TAG_NAME,'p').text
            # 리스트에 넣기
            item_list.append([item_name,rivew_text])
    # 확인
        #print(item_list[-1])
    # 만약 에러가 발생하면
    except:
    # 대기시간 증가 및 확인
        count += 1
        print(count)
    # 에러 리스트에 넣기
        error.append(element)
    # 만약 count가 100번 이상이면 루프 탈출
        if(count>=100):
            break

    # 브라우져 뒤로가기
    driver.execute_script("window.history.go(-1)")
    time.sleep(count)

    #item_list = pd.DataFrame(data=item_list,columns=['Item_Name', 'Ori_img_URL', 'detail_img_URL'])
    #item_list.to_csv('C:/sist1226/getMaket/save.csv')

# 작업 완료 후 드라이버 종료
driver.close()
#print(error)

item_list = pd.DataFrame(data=item_list,columns=['item_name','rivew'])
item_list.to_csv('C:\sist1226\getMaket\sang_rivew.csv')