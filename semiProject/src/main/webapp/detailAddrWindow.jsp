<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.delivery {
	color: #4B62D3;
	font-size: 30px;
	font-weight: bold;
}
</style>


<script type="text/javascript">
	$(function() {
		$("#toggleBtn").click(function() {
			$(".text").toggle();
		})
	})
</script>
</head>
<body>
	<div style="width: 100%">
		<div style="width: 600px; margin: 0 auto;">
			<div style="margin: 0 auto;">
				<span class="delivery">샛별배송</span> <span
					style="font-size: 30px; font-weight: bold;">&nbsp;지역입니다.</span>
				<p style="font-size: 20px;">매일 새벽,문 앞까지 신선함을 전해드려요.</p>
				<br> <br>

				<div>
				
					<div style="width:654px;">
					<input type="text" name="query" placeholder="주소를 검색 해주세요"
						style="width: 500px; height: 50px;">
					<button type="submit"
						style="width: 150px; height: 50px; color: #4B62D3; background-color: white">
						<span class="glyphicon glyphicon-search"></span>&nbsp;재검색
					</button>
					</div>
					
					<br> <br> <input type="text" name="query"
						placeholder="상세 주소를 입력하세요" style="width: 654px; height: 50px;"><br>
					<br>
					<p style="font-size: 7pt;">*저장된 배송지는 최대7일간 임시 저장 후 자동 삭제됩니다.</p>
					<p style="font-size: 7pt;">로그인 할 경우, 회원님의 배송지 목록에 추가됩니다.</p>
					<p>
						<button type="submit"
							style="width: 654px; height: 50px; background-color: #4B62D3; color: white;">저장</button>
					</p>
					<br> <br>

					<span style="color: red; font-weight: bold;">ⓘ샛별배송 지역 중 배송불가 장소 안내</span>

					<div style="width: 600px;">

						<span style="float: left; width:60%; padding:1% 0 10% 0;">관공서/학교/병원/시장/공단지역/산간지역/백화점 등</span>

						<div style="width: 35%; float: right;">
							
								<button id="toggleBtn" style = "float:right;">자세히보기</button>
						
						</div>

						<div style="clear: both"></div>

						<div style="text-align: left;">
							<p class="text">가락동농수산물도매시장</p>
							<p class="text">가락동농수산물시장</p>
							<p class="text">가천대학교</p>
							<p class="text">고려대학교안암캠퍼스</p>
							<p class="text">고매동 일부(일부지역만 배송가능)</p>
							<p class="text">국립중앙박물관</p>
							<p class="text">국민대학교</p>
							<p class="text">덕성여자대학교</p>
							<p class="text">덕양구 신원동 일부(일부지역만 배송가능)</p>
							<p class="text">도내동 일부(원흥지구만 배송가능)</p>
							<p class="text">동덕여자대학교</p>
							<p class="text">반월특수지구</p>
							<p class="text">서경대학교</p>
							<p class="text">서울사이버대학교</p>
							<p class="text">서울시립대학교</p>
							<p class="text">서울여자대학교</p>
							<p class="text">성균관대학교</p>
							<p class="text">성신여자대학교</p>
							<p class="text">세종대학교</p>
							<p class="text">연세대학교</p>
							<p class="text">이화여자대학교</p>
							<p class="text">한국외국어대학교</p>
							<p class="text">홍익대학교</p>
						</div>

					</div>


				</div>



			</div>
		</div>
	</div>


</body>
</html>