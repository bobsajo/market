<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>

<style type="text/css">

.detail_container{
	width: 100%;
}

.detail_wrapper{
	margin: 0px 40px 0px 0px auto;
	text-align: center;
}

#detail_addr{
	width: 50%;
}

</style>

<script>
function sendValue() {
    $("#bying_addr",opener.document).html($("#bying_addr",opener.document).text()+"&nbsp"+$("#detail_addr").val());
    window.close();
  }
</script>

</head>
<body>
	<div class="detail_container">
		<div class="detail_wrapper">
			<h2>상세주소입력창</h2>
			<input id="detail_addr"><br>
			<input type="button" onclick="sendValue();" value="저장">
		</div>
	</div>
</body>
</html>