<div align='center'>
  
  <h3>마켓컬리 클론코딩</h3>
  <h2>새벽마켓</h2>
  <img width="260" alt="bobsajologo" src="https://github.com/bobsajo/market/assets/124232240/374567b2-dfc6-4fc2-a5a5-4a431844707b">
</div>

<div>
  <h3>목차</h3>
  <hr>
  <ol>
    <li>프로젝트 개요</li>
    <li>기술스택</li>
    <li>ERD</li>
    <li>주요기능</li>
    <li>역할</li>
    <li>프로젝트 산출물</li>
  </ol>
  <br>
  <h3>1.프로젝트 개요</h3>
  <hr>
  <p>
    이번 프로젝트에선 그동안 배웠던 JSP, AJAX를 최대한 활용하고 싶었습니다. 그러기엔 쇼핑몰 사이트가 가장 적합하다 생각하였고 쇼핑몰 사이트 중에서도 유명한 마켓컬리를 선정하여 클론코딩을 하기로 하였습니다.
  </p>
  <br>
  <h3>2.기술스택</h3>
  <hr>
  <h4>사용언어</h4>
  <ul>
    <li>JavaScript</li>
    <li>Java</li>
    <li>Python</li>
  </ul>
  <h4>프론트앤드</h4>
  <ul>
    <li>html</li>
    <li>css</li>
  </ul>
  <h4>백엔드</h4>
  <ul>
    <li>jsp</li>
    <li>jquery</li>
  </ul>
  <h4>데이터베이스</h4>
  <ul>
    <li>AWS</li>
    <li>MySql</li>
  </ul>
  <br>
  <h3>3.ERD</h3>
  <hr>
  <img src='https://github.com/bobsajo/market/assets/124232240/d5c35000-a90d-4947-bbca-d8dfb5291bcf' alt='erd' width='750'>
  <br>
  <h3>4.주요기능</h3>
  <hr>
  <ul>
    <li>상품 찜하기</li>
    <li>장바구니</li>
    <li>일일특가</li>
    <li>후기작성</li>
    <li>최근 본 상품</li>
  </ul>  
  <br>
  <h3>5.역할</h3>
  <hr>
  <img src='https://github.com/bobsajo/market/assets/124232240/7ece673e-65ef-4b8d-a3eb-ac84f2e33763' alt='role' width='450'>
  <br>
  <h3>6.프로젝트 산출물</h3>
  <hr>
    <h4>회원가입</h4>
  <p>간단한 입력을 통해 회원가입이 가능합니다.</p>
    <img src='https://github.com/bobsajo/market/assets/124232240/7c1c7f82-ec81-4ae9-81b5-7ab6f3bd42b7' alt='join' width='450'>
    <h4>로그인</h4>
  <p>회원가입한 정보로 로그인할 수 있습니다.</p>
    <img src='https://github.com/bobsajo/market/assets/124232240/031e7152-0def-4006-9a42-8c65b3726fff' alt='login' width='700'>
    <h4>아이디/비밀번호 찾기</h4>
  <p>이메일 인증을 통해서 아이디/비밀번호 찾기 가능합니다.
    <img src='https://github.com/bobsajo/market/assets/124232240/b0e026ec-d10f-4875-ab0f-d15b3b10339a' alt='findid' width='700'>
    <img src='https://github.com/bobsajo/market/assets/124232240/5d224892-81b8-48b1-b98d-cf7565948605' alt='findid' width='700'>
    <img src='https://github.com/bobsajo/market/assets/124232240/61a2d8b9-60e0-47e9-803d-9163be46a9fd' alt='findid' width='700'>
    <h4>메인페이지</h4>
    <img src='https://github.com/bobsajo/market/assets/124232240/6e388ba1-2b4e-4928-8e7c-b57a9186a221' alt='join' width='500'>
    <h4>일일특가</h4>
  <p>TimeSale 테이블에 저장된 상품에서 랜덤으로 3개 뽑아서 메인 홈페이지에 출력</p>
  <p>10~25% 사이로 랜덤하게 할인
  <p>24시간 한정 특가이므로 매일 자정을 기준으로 초기화 됨, 24시간 타이머 설정</p>
    <img src='https://github.com/bobsajo/market/assets/124232240/9fd8ec76-7378-4265-8018-e95ce3d8cbed' alt='daysale' width='700'>
    <h4>카테고리</h4>
  <p>과일, 수산, 육류, 베이커리별로 리스트 출력</p>
    <img src='https://github.com/bobsajo/market/assets/124232240/a8a89d9d-8c55-41cf-a72d-fbc71de4f12b' alt='categorymenu' width='700'>
    <img src='https://github.com/bobsajo/market/assets/124232240/a80781dd-e7fe-42ef-bf1a-6953b108dba2' alt='categorypage' width='450'>
    <h4>최근 본 상품</h4>
  <p>Cookie를 사용한 최근 본 상품 리스트를 최대 3개까지 저장하고 위쪽 화살표로 갈 수록 최신 순으로 나열, 클릭 시
  해당 상품 페이지로 이동</p>
  <p>Cookie란 ? 사이트가 사용하고 있는 서버에서 사용자의 컴퓨터에 저장하는 작은 기록 정보 파일
  Session과 달리 사용자의 컴퓨터에 저장되기 때문에 서버의 저장공간을 절약</p>
    <img src='https://github.com/bobsajo/market/assets/124232240/efce1104-3e53-495e-b0e8-fb691b6fb4b3' alt='recentitem' width='300'>
    <h4>상세페이지</h4>
  <p>해당 상품 설명 / 수량 선택 / 수량에 따른 가격 선택 / 찜 / 장바구니 추가 가능</p>
    <img src='https://github.com/bobsajo/market/assets/124232240/0d404d2d-ca5a-4575-bb7f-bf7850e66cf2' alt='join' width='500'>
    <h4>후기</h4>
  <p>해당 상품의 후기 개수 출력, 추천 순, 최신 등록 순으로 구분하여 사진 나열</p>
  <p>추천 순으로 나열 시, 상위 3명에겐 [베스트]타이틀 적용</p>
  <p>도움돼요 버튼 클릭 시 추천 수 1증가, 한번 더 클릭 시 추천 취소</p>
    <img src='https://github.com/bobsajo/market/assets/124232240/8407c308-ede0-48e6-b7f1-b5c99c9d54bd' alt='join' width='500'>
    <h4>장바구니</h4>
  <p>로그인된 사용자의 장바구니 목록 표시 / 전체선택,삭제 가능 / 수량 선택 가능 / 개별 삭제 가능 / 목록 여닫이 버튼 기능 활성화 / 주소 검색 기능(다음 우편번호 API를 사용하여 기존 주소 수정) / 개별 금액 표시 / 총 금액 표시 </p>
    <img src='https://github.com/bobsajo/market/assets/124232240/6a21721a-97be-4855-8387-e2e943287627' alt='findid' width='700'>
  
</div>
