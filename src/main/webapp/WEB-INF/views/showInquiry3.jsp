<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginId" value="${sessionScope.user_id } " />
<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
</head>
	<!--서머노트 헤더  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"> <!-- header-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

	
		<style type="text/css">
	  	* {
	  		box-sizing: border-box;
	  		margin: 0;
	  		padding: 0;
	  		font-family: "Noto Sans KR", sans-serif;
	  	}
	  	
	  	.container_b {
	  		width: 80%;
	  		margin: auto;
	  	}	
	  	
	  	.writing-header {
	  		position: relative;
	  		margin: 20px 0 0 0;
	  		padding-bottom: 10px;
	  		border-bottom: 1px solid #323232;
	  	}
	  	
	  	.frm {
	  		width: 100%;
	  	}
	  	
	  	input {
	  		width: 100%;
	  		height: 35px;
	  		margin: 5px 0px 10px 0px;
	  		border: 1px solid #e9e8e8;
	  		padding: 8px;
	  		background: #f8f8f8;
	  		outline-color: #e6e6e6;
	  	}
	  	
	  	textarea {
	  		width: 100%;
	  		background: #f8f8f8;
	  		margin: 5px 0px 10px 0px;
	  		border: 1px solid #e9e8e8;
	  		resize: none;
	  		padding: 8px;
	  		outline-color: #e6e6e6;
	  	}
	  	
	  	.btn {
	  		background-color: rgb(236, 236, 236);
	  		border: none;
	  		color: black;
	  		padding: 6px 12px;
	  		font-size: 16px;
	  		cursor: pointer;
	  		border-radius: 5px;
	  	}
	  	
	  	.btn:hover {
			text-decoration: underline;
		}
	
	</style>	
<body>
		<!--헤더 인클루드-->
	<%@ include file="header.jsp"%>

	<!--페이지 내용 시작-->
	<section>
		<h1 class="visually-hidden">홈</h1>
		<!--컨텐츠 영역-->
		<div class="row justify-content-md-center">
        	<h2 class="col-auto my-5">고객센터</h2>
      	</div>
		<div class="container mb-5">
			<div class="mb-4"> <!-- 탭 start-->
			    <div class="nav nav-tabs nav-justified" id="v-pills-tab" role="tablist"> <!-- 탭 menu start-->
			      <button class="nav-link" id="v-pills-01-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="false" onclick="location.href='/purplaying/servicecenter'">공지사항</button>
			      <button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false" onclick="location.href='/purplaying/questions'">자주 묻는 질문</button>
			      <button class="nav-link active" id="v-pills-03-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="true" onclick="location.href='/purplaying/oneonone/list'">1:1 문의</button>
			    </div><!-- 탭 menu end-->
	
	<script type="text/javascript">
		$(document).ready(function() {			/* main() */
			
			//서머노트
			$('.summernote').summernote({
				height: 445,                 // 에디터 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
				disableResizeEditor: true,	// 크기 조절 기능 삭제
				toolbar: [
				   ['fontname', ['fontname']],
				   ['fontsize', ['fontsize']],
				   ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				   ['color', ['forecolor','color']],
				   ['table', ['table']],
				   ['para', ['ul', 'ol', 'paragraph']],
				   ['height', ['height']],
				   ['insert',['picture','link','video']],
				   ['view',['help']]
				]
			});
			// 서머노트 종료
			
			$("#listBtn").on("click", function() {
				//location.href ="<c:url value='/oneonone/list?page=${page}&pageSize=${pageSize}'/>";
				history.back();
			})
			$("#removeBtn").on("click", function() {
				if(!confirm("정말로 삭제하시겠습니까?")) return;
				
				let form = $("#form");
				form.attr("action","<c:url value='/oneonone/remove?page=${page}&pageSize=${pageSize}' />");
				form.attr("method","post");
				form.submit();
			})
			$("#writeBtn").on("click", function() {

				let form = $("#form");
				form.attr("action","<c:url value='/oneonone/write' />");
				form.attr("method","post");
				
				if(formCheck()) {
					form.submit();	
				}	
			})
			
			let formCheck = function() {
				let form = document.getElementById("form")
				if(form.inquiry_title.value=="") {
					alert("제목을 입력해 주세요.")
					form.inquiry_title.focus()
					return false
				}
				if(form.inquiry_context.value=="") {
					alert("내용을 입력해 주세요.")
					form.inquiry_context.focus()
					return false
				}
					return true;
			}
			
			$("#modifyBtn").on("click", function() {
				let form = $("#form")
				let isReadonly = $("input[name=inquiry_title]").attr('readonly')
				
				// 1. 읽기 상태이면 수정상태로 변경
				if(isReadonly=='readonly') {
					$(".writing-header").html("게시판 수정")
					$("input[name=inquiry_title]").attr('readonly', false)
					$("textarea").attr('readonly', false)
					$("#modifyBtn").html("<i class='fa fa-pen'></i> 등록")
					return;
				}
				// 2. 수정상태이면 수정된 내용을 서버로 전송
				form.attr("action","<c:url value='/oneonone/modify?page=${page}&pageSize=${pageSize}'/>")
				form.attr("method","post")
				if(formCheck()){
					form.submit();
				}
					
			})
		
		

		
		})	
		
	</script>
	
	<script type="text/javascript">
		let msg = "${msg}"
		if(msg == "WRT_ERR") alert("게시물 등록에 [실패] 하였습니다. 다시 시도해 주세요.")
		if(msg == "MOD_ERR") alert("게시물 수정에 [실패] 하였습니다. 다시 시도해 주세요.")
	</script>
	
	

	<div class="container_b">
		<h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기" }</h2>
			<form id="form" class="frm" action="" method="post">
				<input type="hidden" name="inquiry_no" value="${boardDto.inquiry_no }">
				<input type="text" name="inquiry_title" value="${boardDto.inquiry_title }" ${mode=="new" ? "" : "readonly='readonly'" }> <br/>
				<%-- <div class="<c:if test="${mode eq 'new'}">summernote</c:if>"> --%><!-- textarea 를 div 로 변환하면 가능 -->
				<textarea rows="20" name="inquiry_context" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.inquiry_context }</textarea><br/>
				<!-- </div> -->
				<c:if test="${mode eq 'new' }">
					<button type="button" id="writeBtn" class="btn btn-wirte"><i class="fa fa-pen"></i>등록</button>
				</c:if>
				<c:if test="${mode ne 'new' }">
					<button type="button" id="writeNewBtn" class="btn btn-wirte" onclick="location.href='<c:url value="/oneonone/write" />'" ><i class="fa fa-pen"></i>글쓰기</button>
				</c:if>
	            <c:if test="${boardDto.user_id eq loginId }">
	                <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i>수정</button>
	                <button type="button" id="removeBtn" class="btn btn-modify"><i class="fa fa-trash"></i>삭제</button>
	            </c:if>
				
				<button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i>목록</button>
				
				
			</form>
	</div>

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>