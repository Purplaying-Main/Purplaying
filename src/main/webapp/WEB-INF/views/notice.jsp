<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
</head>

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
			      <button class="nav-link active" aria-selected="true">공지사항</button>
			      <button class="nav-link" aria-selected="false" onclick="location.href='questions'">자주 묻는 질문</button>
			      <button class="nav-link" aria-selected="false" onclick="location.href='oneonone'">1:1 문의</button>
			    </div><!-- 탭 menu end-->
			    <div class="row col-10 justify-content-center mx-auto"><!-- 탭 컨텐츠 start -->
			      <div class="tab-content" id="v-pills-tabContent">
			        <!-- tab 1 contents -->
			        <div class="tab-pane fade show active py-5" >
									<!-- 게시판 글 내용 -->
									<div class="card p-5 mb-3">
										<!-- 제목 영역  -->
<%-- 										<c:forEach var="noticeDto" items="${list}">
				                    		<tr>
					                            <th scope="row">${noticeDto.notice_id }</th>
					                            <td>${noticeDto.notice_category}</td>
					                            <td>
					                            	<a href="<c:url value="/notice/read?notice_id=${noticeDto.notice_id}&page=${page }&pageSize=${pageSize }"/>">
					                            		${noticeDto.notice_title}
					                            	</a>
					                            </td>
					                            <td>${noticeDto.writer}</td>
					                            <td><fmt:formatDate value="${noticeDto.notice_regdate}" pattern="yyyy-MM-dd" type="date"/></td>
				                        		<td>${noticeDto.view_cnt}</td>
				                        		<td>${noticeDto.notice_private}</td>
				                        	</tr>
				                    	</c:forEach>--%>
				                   
				                    	
										<div class="mt-3">
											<h6 class="card-subtitle mb-2 text-muted">${noticeDto.notice_category}</h6>
											<h5 class="card-title">${noticeDto.notice_title}</h5>
											<small class="card-subtitle mb-2 text-muted"><fmt:formatDate value="${noticeDto.notice_regdate}" pattern="yyyy-MM-dd" type="date"/></small>
										</div>
										<hr class="my-4">
										<!-- 본문 영역 -->
										<div class="px-4 py-2">
											${noticeDto.notice_context}
										</div>
									</div>
									<!-- 글쓰기 목록 버튼 영역 -->
									<div class="my-3 justify-content-end">			
										<!-- 수정권한 확인  -->
										<c:if test="${noticeDto.writer eq sessionScope.user_id}">
											<button type="button" id="modifyBtn" class="btn btn-outline-primary"><i class="fa fa-edit"></i>수정</button>
											<button type="button" id="removeBtn" class="btn btn-outline-danger"><i class="fa fa-trash"></i>삭제</button>
										</c:if>
									</div>
									<!-- 이전글, 다음글 영역 -->
									<div class="table project-table table-centered table-nowrap table-hover mb-4">
										<div class="fs-6 w-90">
												<ul class="row border-2 border-bottom py-2">
													<li class="col fw-semibold">이전글</li>
													<li class="col text-muted">${noticeDto.notice_category}</li>
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
									</div>
						
									<div class="row mx-auto col-md-4">
										<button type="button" class="btn btn-outline-primary my-3" onclick="history.back(-1)">목록으로 돌아가기</button>		
			       					</div>
			        </div>
			    </div><!-- 탭 컨텐츠 end -->
			</div><!-- 탭 end-->
			
		</div><!-- 컨텐츠영역 end-->
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>