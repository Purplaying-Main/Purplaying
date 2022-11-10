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
				        <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
				            <div class="row justify-content-end mt-4">
					            <form class=" col-lg-auto mb-5 mb-lg-0 me-lg-3" role="search" action="genre">
					            	<input type="search" class="form-control" name="search" placeholder="Search..." aria-label="Search" onclick="frm.submit()">
					           	</form>
				                <table class="table project-table table-centered table-nowrap table-hover">
				                    <thead class="border-3 border-bottom">
				                        <tr>
				                            <th scope="col">#</th>
				                            <th scope="col">카테고리</th>
				                            <th scope="col">제목</th>
				                            <th scope="col">작성자</th>
				                            <th scope="col">작성일</th>
				                            <th scope="col">조회수</th>
				                            <th scope="col">공개</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                    	<c:forEach var="noticeDto" items="${list}">
				                    		<tr>
					                            <th scope="row">${noticeDto.notice_id }</th>
					                            <td>${noticeDto.notice_category}</td>
					                            <td>${noticeDto.notice_title}</td>
					                            <td>${noticeDto.writer}</td>
					                            <td><fmt:formatDate value="${noticeDto.notice_regdate}" pattern="yyyy-MM-dd" type="date"/></td>
				                        		<td>${noticeDto.view_cnt}</td>
				                        		<td>${noticeDto.notice_private}</td>
				                        	</tr>
				                    	</c:forEach>
				                    </tbody>
				                </table>
				            </div>
				            <!-- end project-list -->
				            <div class="pt-3 row">
				                <!-- 페이지 네비게이션 -->
				                <ul class="pagination mb-0 col-10 justify-content-center">
				                	<c:if test="${totalCnt == null || totalCnt == 0 }">
											<h6 class="row text-center ">게시물이 없습니다.</h6>
									</c:if>
					                <!-- 게시물이 있는 경우, page nav 출력  -->
									<c:if test="${totalCnt != null || totalCnt != 0 }">
										<c:if test="${pr.showPrev }">
											<li class="page-item disabled">
						                        <a class="page-link" href="<c:url value="/notice/list?page=${pr.beginPage-1 }"/>" tabindex="-1" aria-disabled="true">Previous</a>
						                    </li>
										</c:if>
										<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
											<li class="page-item">
												<a class="page-link" href="<c:url value="/notice/list?page=${i}"/>"> ${i} </a>
											</li>
										</c:forEach>
										<c:if test="${pr.showNext }">
											<li class="page-item disabled">
						                        <a class="page-link" href="<c:url value="/notice/list?page=${pr.endPage+1 }"/>" tabindex="-1" aria-disabled="true">Previous</a>
						                    </li>
										</c:if>
									</c:if>
								</ul>
								
				              <!--   <div class="col-1"></div>
				                <ul class="pagination mb-0 col-10 justify-content-center">
				                    <li class="page-item disabled">
				                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
				                    </li>
				                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
				                    <li class="page-item"><a class="page-link" href="#">2</a></li>
				                    <li class="page-item"><a class="page-link" href="#">3</a></li>
				                    <li class="page-item">
				                        <a class="page-link" href="#">Next</a>
				                    </li>
				                </ul> -->
								<button type="button" class="col-1 btn btn-primary" style="${adminWrite}" onclick="location.href='noticeWrite'">작성</button>
				            </div>
				            <!-- end row -->
				        </div>


				      </div><!-- 탭 컨텐츠 end -->
				</div><!-- 탭 end-->
			</div>
		</div><!-- 컨텐츠영역 end-->
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>