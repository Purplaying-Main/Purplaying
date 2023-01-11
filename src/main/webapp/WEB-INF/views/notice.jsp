<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta4.jsp"%>
</head>

<body>
	<!--헤더 인클루드-->
	<%@ include file="header.jsp"%>
<%-- 	<script src="${pageContext.request.contextPath}/resources/assets/js/noticeBtnClick.js"></script>
 --%>	<!-- 삭제 에러 메세지 스크립트  -->
	<script type="text/javascript">
		let msg = "${msg}"
		if(msg == "WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.")
		if(msg == "MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.")
	</script>
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
			      <button class="nav-link active" aria-selected="true">공지사항</button>
			      <button class="nav-link" aria-selected="false" onclick="location.href='/purplaying/questions'">자주 묻는 질문</button>
			      <button class="nav-link" aria-selected="false" onclick="location.href='/purplaying/oneonone/list'">1:1 문의</button>
			    </div><!-- 탭 menu end-->
			    <div class="row col-10 justify-content-center mx-auto"><!-- 탭 컨텐츠 start -->
			      <div class="tab-content" id="v-pills-tabContent">
			        <!-- tab 1 contents -->
			        <div class="tab-pane fade show active py-5" >
									<!-- 게시판 글 내용 -->
									<form class="card p-5 mb-3" id="notice_form" action="" method="post">
										<input type="hidden" name="notice_id" value="${noticeDto.notice_id }">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<!-- 제목 영역  -->			                    	
										<div class="mt-3">
											<h6 class="card-subtitle mb-2 text-muted">${noticeDto.notice_category == 1 ? "공지사항" : noticeDto.notice_category == 2 ? "이벤트" : "기타"}</h6>
											<h4 class="card-title">${noticeDto.notice_title}</h4>
											<small class="card-subtitle mb-2 text-muted"><fmt:formatDate value="${noticeDto.notice_regdate}" pattern="yyyy-MM-dd" type="date"/></small>
											<small class="card-subtitle mb-2 text-muted">writer : ${noticeDto.user_nickname} </small>
										</div>
										<hr class="my-4">
										<!-- 본문 영역 -->
										<div class="px-4 py-2">
											${noticeDto.notice_context}
										</div>
										<!-- 글쓰기 목록 버튼 영역 -->
										<hr class="my-4">
										<div class="mt-3 text-end">			
											<!-- 수정권한 확인  -->
											<sec:authorize access="hasRole('ROLE_ADMIN')">
												<button type="button" id="modifyBtn" class="btn btn-outline-primary">
													<input type="hidden" name="${csrf.parameterName}" value="${csrf.token}" /><i class="fa fa-edit"></i>수정</button>
												<button type="button" id="removeBtn" class="btn btn-outline-danger"><i class="fa fa-trash">
													<input type="hidden" name="${csrf.parameterName}" value="${csrf.token}" /></i>삭제</button>
											</sec:authorize>
										</div>
									</form>
									
									<!-- 이전글, 다음글 영역
									<div class="table project-table table-centered table-nowrap table-hover mb-4">
										<div class="fs-6 w-90">
												<ul class="row border-2 border-bottom py-2">
													<li class="col fw-semibold">이전글</li>
													<li class="col text-muted">${prev_notice_id}</li>
													<li class="col-8 fw-light text-truncate">${noticeDto.notice_title}</li>
													<li class="col text-muted"><fmt:formatDate value="${noticeDto.notice_regdate}" pattern="yyyy-MM-dd" type="date"/></li>
												</ul>
												<ul class="row border-2 border-bottom py-2">
													<li class="col fw-semibold">다음글</li>
													<li class="col text-muted">${noticeDto.notice_category}</li>
													<li class="col-8 fw-light text-truncate">${noticeDto.notice_title}</li>
													<li class="col text-muted"><fmt:formatDate value="${noticeDto.notice_regdate}" pattern="yyyy-MM-dd" type="date"/></li>
												</ul>
										</div>
									</div> -->
						
									<div class="row mx-auto col-md-4">
										<button type="button" id="listBtn" class="btn btn-outline-primary my-3">목록으로 돌아가기</button>		
			       					</div>
			        </div>
			    </div><!-- 탭 컨텐츠 end -->
			</div><!-- 탭 end-->
			
		</div><!-- 컨텐츠영역 end-->
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
	<!-- 공지사항 버튼 클릭 스크립트(listBtn, removeBtn, writeBtn) -->
	<script type="text/javascript">
	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			location.href ="<c:url value='/notice/list?page=${page}&pageSize=${pageSize}' />";
		})
		
		//remove
		$("#removeBtn").on("click", function() {
			if(!confirm("정말로 삭제하시겠습니까?")) return;
			
			let form = $("#notice_form")
			form.attr("action","<c:url value='/notice/remove?page=${page}&pageSize=${pageSize}' />")
			form.attr("method", "post")
			form.submit()
		})
		
		//write
		$("#writeBtn").on("click", function() {
			let form = $("#notice_form");
			form.attr("action", "<c:url value='/notice/write' />")
			form.attr("method", "post")
			
			if(formCheck())
				form.submit()					
		})
		
		//modify
		$("#modifyBtn").on("click", function() {
				let form = $("#notice_form");
				form.attr("action", "<c:url value='/notice/modify' />")
				form.attr("method", "get")	
				form.submit()
			})
	})
	</script>
</body>
</html>