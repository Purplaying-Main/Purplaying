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
	comment :
	<input type="text" name="comment" />
	<br />
	<button id="sendBtn" type="button">SEND</button>
	<button id="insertBtn" type="button">댓글작성</button>
	<button id="modBtn" type="button">수정하기</button>
	<div id="commentList">
				
	</div>
	<div id="rplybox">
		<form class="rplyForm">
			<textarea id="rply" class="form-control"  placeholder="답글을 입력하세요."></textarea>
		</form>
	</div>
	


	<script type="text/javascript">
		$(document).ready(function() {
			
			let prdt_id = 10
						
			$("#modBtn").click(function() {
				//showList(bno)
				let chat_no = $(this).attr("data-chat_no")
				let chat_context = $("input[name=comment]").val();
				
				if(chat_context.trim() == '') {
					alert("댓글을 입력해 주세요.")
					$("input[name=comment]").focus()
					return
				}
				
				$.ajax({
					type : 'PATCH',				//요청 메서드
					url : '/purplaying/project/' + prdt_id + '/community/' +chat_no,				//요청 URI
					headers :	{ "content-type" : "application/json"},				//요청 헤더
					data : JSON.stringify({chat_context:chat_context}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
						alert(result)
						showList(prdt_id)
						$("#commentList").html(toHtml(result))
			     	},
			    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
				})
			})/* 
			$("#commentList").on("click", ".rplyBtn", function() {
				alert("답변 버튼 클릭함")
				
			}) */
			$("#insertBtn").click(function() {
				//showList(bno)
				
				let comment = $("input[name=comment]").val();
				
				if(comment.trim() == '') {
					alert("댓글을 입력해 주세요.")
					$("input[name=comment]").focus()
					return
				}
				
				$.ajax({
					type : 'post',				//요청 메서드
					url : '/purplaying/project/' + prdt_id + '/community',				//요청 URI
					headers :	{ "content-type" : "application/json"},				//요청 헤더
					data : JSON.stringify({prdt_id:prdt_id, chat_context:comment}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
						alert(result)
						showList(prdt_id)
						$("#commentList").html(toHtml(result))
			     	},
			    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
				})
			})
			
				
			$("#commentList").on("click", ".delBtn", function() {			// commentList안에 있는 delBtn버튼에다가 클릭이벤트를 등록해야 함.
				alert("삭제 버튼 클릭됨")
				
				let chat_no = $(this).parent().attr("data-chat_no")				// li 태그는 <button>의 부모임.
				let prdt_id = $(this).parent().attr("data-prdt_id")				// attr 중 사용자 정의 attr를 선택함.
				
				$.ajax({
					type : 'DELETE',					//요청 메서드
					url : '/purplaying/project/' + prdt_id + '/community/' +chat_no,			//요청 URI
					success : function(result) {			//서버로부터 응답이 도착하면 호출될 함수
						alert(result)						//result 서버가 전송한 데이터
						showList(prdt_id)
						$("#commentList").html(toHtml(result))
					},
					error : function() { alert("Error") }	//에러가 발생했을 때 호출될 함수
				})
				
			})
			
			$("#commentList").on("click", ".modBtn", function() {			// commentList안에 있는 delBtn버튼에다가 클릭이벤트를 등록해야 함.
				//alert("댓글수정 버튼 클릭됨")
				
			 	let chat_no = $(this).parent().attr("data-chat_no")				// li 태그는 <button>의 부모임.
				//클릭된 수정버튼의 부모(li)에 span 태그의 text만 가져옴
				let chat_context = $("span.chat_context",$(this).parent()).text()

				//1. comment의 내용을 input에 출력해주기
				$("input[name=comment]").val(chat_context)
				//2. cno전달하기
				$("#modBtn").attr("data-chat_no", chat_no)
				

			}) 
		})
		
		let showList = function(prdt_id) {
			$.ajax({
				type : 'GET',		//요청 메서드
				url : '/purplaying/community?prdt='+prdt_id,		// 요청 URI
				success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
					/* json = JSON.stringify(result) */
					$("#commentList").html(toHtml(result))		// result는 서버가 전송한 데이터	
				},
				error : function() { alert("errorsss") }	// 에러가 발생할 때, 호출될 함수
			})
		}
		
		let toHtml = function(comments) {
			let tmp = "<ul>"
			
			comments.forEach(function(comment) {
				tmp += '<li data-chat_no=' + comment.chat_no
				tmp += ' data-prdt_id=' + comment.prdt_id + '>'
				tmp += ' chat_writer= <span class="chat_writer" >' + comment.chat_writer + '</span>'
				tmp += ' chat_context= <span class="chat_context" >' + comment.chat_context + '</span>'
				tmp += ' data-user_no=' + comment.user_no
				tmp += ' <button class="delBtn">삭제</button>'
				tmp += ' <button class="modBtn">수정</button>'
				tmp += ' <button class="rplyBtn">답변</button>'
				tmp += ' <p class="my-0 text-small">작성일 > ' + toStringByFormatting(comment.chat_date) + ' </p></div>'
				tmp += '</li>'
			})

			return tmp += "</ul>"
		}
		
		function toStringByFormatting(source,delimiter = '-'){
	         let date_source = new Date(source);
	        let month = date_source.getMonth() + 1;
	        let day = date_source.getDate();

	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;

	        return date_source.getFullYear() + '-' + month + '-' + day;

	     }
		
		showList(prdt_id)

/* 	tmp += '<div id="rplybox">'
		tmp += '<form class="rplyForm">'
			tmp += '<textarea id="rply" class="form-control"  placeholder="답글을 입력하세요.">' + reply.chat_context + '</textarea>'
			tmp += '</form>'
				tmp += '</div>'		 */
	</script>

</body>
</html>