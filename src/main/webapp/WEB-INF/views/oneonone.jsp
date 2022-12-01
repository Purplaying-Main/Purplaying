<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<c:set var="readAuthority" value="${sessionScope.inquiry_private == false ? '':'display:none' }" />

<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
<link rel="stylesheet" href="/src/main/webapp/resources/assets/css/indexHover.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
	<!--헤더 인클루드-->
	<%@ include file="header.jsp"%>

	<!--페이지 내용 시작-->
	<section>
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
					<button class="nav-link" aria-selected="false" onclick="location.href='/purplaying/notice/list'">공지사항</button>
					<button class="nav-link" aria-selected="false" onclick="location.href='/purplaying/questions'">자주 묻는 질문</button>
					<button class="nav-link active" aria-selected="true">1:1문의</button>
				</div>
				<!-- 탭 menu end-->
				<div class="row col-10 justify-content-center mx-auto">
					<div class="tab-content" id="v-pills-tabContent">
						<!-- tab 1 contents -->
						<div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab" >
						<input type="hidden" name=user_role value="${sessionScope.user_role}">
						<input type="hidden" name=inquiry_private value="${sessionScope.inquiry_private}">
						<div class="row justify-content-end mt-4">
							<form class=" col-lg-auto mb-5 mb-lg-0 me-lg-3" role="search" action="genre">
						<%--	<form action="<c:url value="/oneonone/list" />" class="search-form" method="get">  --%>
								<input type="search" class="form-control" name="search" value="${param.keyword }" placeholder="Search..." aria-label="Search"	onclick="frm.submit()">
							</form>
							
							<table class="table project-table table-centered table-nowrap table-hover">
								<thead class="border-3 border-bottom">
									<tr>
										<th scope="col">#</th>
										<th scope="col">답변상태</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">공개여부</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="oneononeDto" items="${list }">
										<tr>
											<td class="no">${oneononeDto.inquiry_no }</td>
											<td class="state">${oneononeDto.inquiry_state eq 0 ? "답변중" : "답변완료" }</td>
											<td class="title"><a href="<c:url value="/oneonone/read?inquiry_no=${oneononeDto.inquiry_no}&page=${page }&pageSize=${pageSize }"/>">
													${oneononeDto.inquiry_title } </a></td>
											<td class="writer">${oneononeDto.writer }</td>
											<td class="private">${oneononeDto.inquiry_private == true ? "공개" : "비공개" }</td>

											<td class="regdate"><fmt:formatDate	value="${oneononeDto.inquiry_regdate }" pattern="yyyy-MM-dd" type="date" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<!-- end project-list -->
						<div class="pt-3 row">
							<!-- 검색창 -->
							<div class="col-1"></div>
								<ul class="pagination mb-0 col-10 justify-content-center">
				                	<c:if test="${totalCnt == null || totalCnt == 0 }">
											<h6 class="row text-center ">게시물이 없습니다.</h6>
									</c:if>
					                <!-- 게시물이 있는 경우, page nav 출력  -->
									<c:if test="${totalCnt != null && totalCnt != 0 }">
										<c:if test="${pr.showPrev }">
											<li class="page-item">
						                        <a class="page-link" href="<c:url value="/oneonone/list?page=${pr.beginPage-1 }"/>">Prev</a>
						                    </li>
										</c:if>
										<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
											<li class="page-item">
												<a class="page-link" href="<c:url value="/oneonone/list?page=${i}"/>"> ${i} </a>
											</li>
										</c:forEach>
										<c:if test="${pr.showNext }">
											<li class="page-item">
						                        <a class="page-link" href="<c:url value="/oneonone/list?page=${pr.endPage+1 }"/>">Next</a>
						                    </li>
										</c:if>
									</c:if>
								</ul>
	
							<button type="button" id="writeBtn" class="col-1 btn btn-primary" >작성</button>

						</div>
						<!-- end row -->
					</div><!-- 탭 컨텐츠 end -->
				</div>

				</div>
				<!-- 탭 end-->
			</div>
		</div>
		<!-- 컨텐츠영역 end-->
	</section>
	<!--페이지 내용 종료-->
		<script type="text/javascript">
		$(document).ready(function() {
			$("#listBtn").on("click", function() {
				location.href ="<c:url value='/oneonone/list?page=${page}&pageSize=${pageSize}' />";
			})
			
			$("#removeBtn").on("click", function() {
				if(!confirm("정말로 삭제하시겠습니까?")) return;
				
				let form = $("#form")
				form.attr("action","<c:url value='/oneonone/remove?page=${page}&pageSize=${pageSize}' />")
				form.attr("method", "post")
				form.submit()
			})
			
			$("#writeBtn").on("click", function() {
			location.href ="<c:url value='/oneonone/write' />";	
		})

		})
	</script>

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>