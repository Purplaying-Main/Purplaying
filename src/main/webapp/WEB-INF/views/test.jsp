<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<title>comment list</title>
</head>
<body>
	<h2>CommentTest</h2>
	<button id="sendBtn" type="button" >SEND</button>
	<div id="commentList" ></div>
	
	<script type="text/javascript">
		let prdt_id = 1
		
		let showList = function(prdt_id) {
			$.ajax({
				type : 'GET',		//요청 메서드
				url : '/purplaying/communitys?prdt_id='+prdt_id,		// 요청 URI
				success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
					$("#commentList").html(result)		// result는 서버가 전송한 데이터
				},
				error : function() { alert("error") }	// 에러가 발생할 때, 호출될 함수
			})
		}
		
		$(document).ready(function() {
			$("#sendBtn").click(function() {
				showList(prdt_id)
			})
		})
	</script>
	
</body>
</html>