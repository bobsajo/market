from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import pandas as p
import time

# 크롬드라이버 가져오기
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
# 마켓컬리 베스트 상품 페이지
url = 'https://www.kurly.com/collections/market-best'
driver.get(url)
driver.implicitly_wait(time_to_wait=5)

# 상품 div 가져옴
elements = driver.find_elements(By.CLASS_NAME, 'css-0')
#print(elements)
item_list = []
# 크롤링 딜레이시간, 에러가 날 경우 count+=1 헤서 딜레이를 늘려줄것
count = 2
error = []
# 상품의 개수만큼 반복
for i in range(len(elements)):
# 페이지를 이동하면 driver의 elements를 다시 받아줘야한다.
# 상품 상세보기로 이동했다가 다시 돌아오면 elements사용에 오류가 났다.
# 그래서 반복문을 시작할 때 elemets를 새로 받아준다.
    elements = driver.find_elements(By.CLASS_NAME, 'css-0')
    element = elements[i]
    #print(element)