<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
</head>
<body>
	<%@ include file="header.jsp"%>

	<!--메인 컨테이너 -->
	<section>
		<h1 class="visually-hidden">HOME</h1>
		<div class="contentsWrap">
			<!--컨텐츠 영역-->
			<!-- creator 더보기 -->
			<div class="album">
				<div class="container py-8">
					<!-- genre div start -->
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<c:forEach var="UserDto" items="${creator_view }">
							<div class="col">
								<!-- 창작자 list start -->
								<li class="row d-flex border rounded p-3 m-1">
									<div class="col-4">
										<img src="${UserDto.user_profile }"
											class="img-thumbnail rounded-circle" alt="유저 프로필">
									</div>
									<div class="col">
										<h5 class="row text-primary mt-2">${UserDto.user_nickname }</h5>
										<h6 class="row text-muted">${UserDto.user_id }</h6>
										<h6 class="row text-muted" onclick="location.href='${pageContext.request.contextPath}/creatorSearch/${UserDto.user_id}/'" style="color: #9E62FA; cursor:pointer;">올린 프로젝트 더보기</h6>
									</div>
								</li>
								<!-- 창작자 list end -->
							</div>
						</c:forEach>
					</div>
					<br> <br>
					<div class="pagination mb-0 col-12 justify-content-center">

 						<c:if test="${totalCnt != null || totalCnt != 0 }">
							<c:if test="${pr2.showPrev }">
								<li class="page-item"><a class="page-link"
									href="<c:url value="/creatorViewMore${pr2.sc2.getQueryString(pr2.beginPage-1) }" />">
										&lt; </a></li>
							</c:if>
							<c:forEach var="i" begin="${pr2.beginPage }"
								end="${pr2.endPage }">
								<li class="page-item"><a class="page-link <c:if test="${pr2.sc2.page==i}">active</c:if>"
									href="<c:url value="/creatorViewMore${pr2.sc2.getQueryString(i)}&keyword=${param.keyword}" />">${i }</a>
								</li>
							</c:forEach>
							<c:if test="${pr2.showNext }">
								<li class="page-item"><a class="page-link"
									href="<c:url value="/creatorViewMore${pr2.sc2.getQueryString(pr2.endPage+1) }" />">
										&gt; </a></li>
							</c:if>
						</c:if> 					

					</div>
				</div>
			</div>
		</div>

	</section>


	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>