<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="prev_notice_id" value="${noticeDto.notice_id -1}" />
<c:set var="adminAns"
	value="${sessionScope.ans_state == 0 ? 'display:none':'' }" />
<fmt:parseDate var="ans_regdate" value="${dateString}" pattern="dd-MM-yyyy HH:mm:ss"/>
<fmt:formatDate var="newFormattedDateString" value="${ans_regdate}" pattern="yyyy-MM-dd"/>

<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta4.jsp"%>
</head>

<body>
	<!--헤더 인클루드-->
	<%@ include file="header.jsp"%>

	<script type="text/javascript">
		let msg = "${msg}"
		if(msg == "WRT_ERR") alert("게시물 등록에 [실패] 하였습니다. 다시 시도해 주세요.")
		if(msg == "MOD_ERR") alert("게시물 수정에 [실패] 하였습니다. 다시 시도해 주세요.")
	</script>

	<!--페이지 내용 시작-->
	<section>
		<h1 class="visually-hidden">홈</h1>
		<!--컨텐츠 영역-->
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">고객센터</h2>
		</div>
		<div class="container mb-5">
			<div class="mb-4">
				<!-- 탭 start-->
				<div class="nav nav-tabs nav-justified" id="v-pills-tab"
					role="tablist">
					<!-- 탭 menu start-->
					<button class="nav-link" id="v-pills-01-tab" data-bs-toggle="pill"
						data-bs-target="#v-pills-tab01" type="button" role="tab"
						aria-controls="v-pills-tab01" aria-selected="false"
						onclick="location.href='/purplaying/servicecenter'">공지사항</button>
					<button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill"
						data-bs-target="#v-pills-tab02" type="button" role="tab"
						aria-controls="v-pills-tab02" aria-selected="false"
						onclick="location.href='/purplaying/questions'">자주 묻는 질문</button>
					<button class="nav-link active" id="v-pills-03-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-tab03"
						type="button" role="tab" aria-controls="v-pills-tab03"
						aria-selected="true"
						onclick="location.href='/purplaying/oneonone/list'">1:1
						문의</button>
				</div>
				<!-- 탭 menu end-->

				<div class="row col-10 justify-content-center mx-auto">
					<!-- 탭 컨텐츠 start -->
					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade show active py-5">
							<h2 class="writing-header">일대일 문의</h2>
							<form class="card p-5 mb-3" id="form" action="" method="post">
								<input type="hidden" name="inquiry_no"
									value="${oneononeDto.inquiry_no }">
								<!-- 제목 영역  -->
								<div class="mt-3">
									<h4 class="card-title">${oneononeDto.inquiry_title}</h4>
									<small class="card-subtitle mb-2 text-muted">
									<fmt:formatDate value="${oneononeDto.inquiry_regdate}" pattern="yyyy-MM-dd"	type="date" /></small> 
									<small class="card-subtitle mb-2 text-muted">writer : ${oneononeDto.writer} | user_id : ${sessionScope.user_id}</small>
								</div>
								<hr class="my-4">
								<!-- 본문 영역 -->
								<div class="px-4 py-2">${oneononeDto.inquiry_context}</div>
								<!-- 글쓰기 목록 버튼 영역 -->
								<hr class="my-4">
								<div class="mt-3 text-end">
									<!-- 수정권한 확인  -->
									<c:if test="${oneononeDto.writer eq sessionScope.user_id or sessionScope.user_id eq 'admin@gmail.com'}">
										<button type="button" id="modifyBtn" class="btn btn-outline-primary">
											<i class="fa fa-edit"></i>수정
										</button>
										<button type="button" id="removeBtn" class="btn btn-outline-danger">
											<i class="fa fa-trash"></i>삭제
										</button>
									</c:if>
								</div>
							</form>

							<%-- <button type="button" id="ansBtn" class="col-1 btn btn-primary"	style="${adminWrite}" class="btn btn-info btn-sm">답변</button> --%>
							<input type="hidden" name="inquiry_State" value="${ansState}">
							<div id="ans_area" style="${ansState ? '' :'display:none'}">
								<form class="card p-5 mb-3" id="Ansform" action="" method="post">
									<input type="hidden" id="inquiry_no" name="inquiry_no" value="${oneononeDto.inquiry_no }"> 
									<input type="hidden" id="ans_no" name="ans_no" value="${ansDto.ans_no }">
									<input type="hidden" name="admin_id" value="${ansDto.admin_id }">
									<!-- 답변 영역  -->
									<div class="mt-3">
										<h4 class="card-title">${oneononeDto.inquiry_title}</h4>
										<small class="card-subtitle mb-2 text-muted" name="ans"><fmt:formatDate
												value="${ansDto.ans_regdate}" pattern="yyyy-MM-dd" type="date" /></small> 
												<small class="card-subtitle mb-2 text-muted">
												writer : ${oneononeDto.writer} | user_id : ${sessionScope.user_id}</small>
									</div>
									<hr class="my-4">
									<!-- 본문 영역 -->
									<div class="px-4 py-2">${ansDto.ans_context}</div>
									<!-- 글쓰기 목록 버튼 영역 -->
									<hr class="my-4">
									<div class="mt-3 text-end">
										<!-- 수정권한 확인  -->
										<c:if test="${sessionScope.user_id eq 'admin@gmail.com'}">
											<button type="button" id="ans_modifyBtn" class="btn btn-outline-primary">
												<i class="fa fa-edit"></i>수정
											</button>
											<button type="button" id="removeAnsBtn" class="btn btn-outline-danger">
												<i class="fa fa-trash"></i>삭제
											</button>
										</c:if>
									</div>
								</form>
							</div>
							<button type="button" id="ansBtn" class="col-1 btn btn-primary"	style="${adminWrite}" class="btn btn-info btn-sm">답변</button>
							<!-- 목록으로 가기 -->
							<div class="row mx-auto col-md-4">
								<button type="button" id="OneononeListBtn" class="btn btn-outline-primary my-3">목록으로 돌아가기</button>
							</div>
							<div class="modal fade" id="ansModal" tabindex="-1" aria-labelledby="ansModiModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header p-5 pb-4 border-bottom-0">
											<h5 class="fw-bold mb-0">답변 작성하기</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body p-5 pt-0">
											<form class="">
												<h5>질문 내용</h5>
												<div>${oneononeDto.inquiry_context}</div>
												<hr class="mb-4">
												<h5>문의 답변</h5>
												<textarea class="form-control mt-2 summernote" id="ansWriteContext">${ansDto.ans_context}</textarea>
												<button class="w-100 my-3 btn btn-lg rounded-3 btn-primary"	id="ansComplete" type="button">답변 저장</button>
											</form>
										</div>
										<!-- modal body -->
									</div>
								</div>
							</div>
							<!-- Modal end-->
							<div class="modal fade" id="ans_modiModal" tabindex="-1" aria-labelledby="ansModiModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header p-5 pb-4 border-bottom-0">
											<h5 class="fw-bold mb-0">답변 수정하기</h5>
											<input type="hidden" id="inquiry_no" name="inquiry_no" value="${oneononeDto.inquiry_no }">
											<input type="hidden" name="ans_no" value="${ansDto.ans_no }">
											<input type="hidden" name="ans_context" value="${ansDto.ans_context }">
											<input type="hidden" id="ans_state" name="ans_state" value="${ansDto.ans_state }">
											<input type="hidden" id="admin_id" name="admin_id" value="${ansDto.admin_id }">
											<input type="hidden" id="ans_regdate" name="ans_regdate" value="${ansDto.ans_regdate }">
											<button type="button" class="btn-close"	data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body p-5 pt-0">
										<!-- 답변 수정 란 -->
               								<form class="" method="post">
												<h5>질문 내용</h5>
												<div>${oneononeDto.inquiry_context}</div>											 
												<hr class="mb-4">
												<h5>문의 답변</h5>
												<textarea class="form-control mt-2 summernote" id="ansModiContext" name="ans_context">${ansDto.ans_context}</textarea>
											 	<button class="w-100 my-3 btn btn-lg rounded-3 btn-primary" id="ansModiComplete" type="button">답변 저장</button>
											</form>
										</div>
										<!-- modal body -->
									</div>
								</div>
							</div>
							<!-- Modal end-->

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#OneononeListBtn").on("click", function() {
			location.href ="<c:url value='/oneonone/list?page=${page}&pageSize=${pageSize}' />";
		})
		
		//remove
		$("#removeBtn").on("click", function() {
			if(!confirm("정말로 삭제하시겠습니까?")) return;
			
			let form = $("#form")
			form.attr("action","<c:url value='/oneonone/remove?page=${page}&pageSize=${pageSize}' />")
			form.attr("method", "post")  
			
			form.submit()
		})
		
		//write
		$("#writeBtn").on("click", function() {
			let form = $("#form");
			form.attr("action", "<c:url value='/oneonone/write' />")
			form.attr("method", "post")
			
			if(formCheck())
				form.submit()					
		})
		
		//modify
		$("#modifyBtn").on("click", function() {
			let form = $("#form");
			form.attr("action", "<c:url value='/oneonone/modify?page=${page}&pageSize=${pageSize}' />")
			form.attr("method", "get")
			
			form.submit()
		})
		
		//writeans
		$("#ansBtn").on("click", function() {
			$('#ansModal').modal("show");		
		})
		
		//ansComplete
		$("#ansComplete").on("click", function() {
			let ansData = {ans_context:$('#ansWriteContext').val(),inquiry_no:$('#inquiry_no').val()}
			alert($('#ansWriteContext').val())
			$.ajax({
	            type : 'post',										// 요청 메서드
	            url : '/purplaying/oneonone/write/ans',								// 요청 URI
	            headers : { "content-type" : "application/json" }, 	// 요청 헤더	//생략가능
	            dataType : 'text',									// 서버에서 전송받을 데이터타입
	            data : JSON.stringify(ansData),						// 서버로 전송할 데이터,stringify()로 직렬화 필요,	//실제 데이터
	            success : function(result) {						// 서버로부터 응답이 도착하면 호출될 함수 { 정상적으로 요청, 응답 시 처리 }
	            	$('#ansModal').modal("hide")
	            	location.reload();
				},													
	            error : function() {alert("error")}					// 에ꁰ가 발생했을 떄, 호출될 함수 { 오류 발생 시 처리 }
			})
				
		}) 
		
		
		//removeans
		$("#removeAnsBtn").on("click", function() {
			if(!confirm("정말로 삭제하시겠습니까?")) return;
			
			let form = $("#Ansform")
//			alert($(this).serialize())
			console.log($(this).serialize());
			form.attr("action","<c:url value='/oneonone/remove/ans?page=${page}&pageSize=${pageSize}' />")
			form.attr("method", "post")  
			
			form.submit()
		})
		
		//ans_modifyBtn	
		$("#ans_modifyBtn").on("click", function() {
			$('#ans_modiModal').modal("show");		
		})
		

		//ansModiComplete
		$("#ansModiComplete").click(function() {

			let ansmodiData = {ans_context:$('#ansModiContext').val()
					,ans_no:$('#ans_no').val()
					,ans_state:$('#ans_state').val()
					,admin_id:$('#admin_id').val()
					,inquiry_no:$('#inquiry_no').val() }

			
		 	$.ajax({
	            type : 'post',										// 요청 메서드
	            url : '/purplaying/oneonone/modify/ans',					// 요청 URI
	            headers : { "content-type" : "application/json" }, 	// 요청 헤더	//생략가능
	            dataType : 'text',									// 서버에서 전송받을 데이터타입
	            data : JSON.stringify(ansmodiData),						// 서버로 전송할 데이터,stringify()로 직렬화 필요,	//실제 데이터
	            success : function(result) {						// 서버로부터 응답이 도착하면 호출될 함수 { 정상적으로 요청, 응답 시 처리 }
	      			$('#ans_modiModal').modal("hide")
	            	location.reload();
				},												
	            error : function() {alert("error")}					// 에ꁰ가 발생했을 떄, 호출될 함수 { 오류 발생 시 처리 }
			})

		})
		
	})
		
	</script>

</body>
</html>