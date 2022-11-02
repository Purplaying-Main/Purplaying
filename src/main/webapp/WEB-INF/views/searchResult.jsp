<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<!-- 펀딩 프로젝트 -->
			<div class="album">
				<div class="dropdown container">
					<p>
					<h2>
						"<%=request.getParameter("search")%>" 검색 결과
					</h2>
					</p>
				</div>
				<div class="container py-4">
					<h4>
						<a>창작자명</a>
					</h4>
					<div class="col">
					<h5>검색 결과가 [%n]건 있습니다.</h5>
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
							<div class="col">
								<!-- 창작자 list start -->
								<li class="row d-flex border rounded p-3 m-1">
					                <div class="col-4"><img src="https://picsum.photos/90" class="img-thumbnail rounded-circle" alt="유저 프로필"></div>
					                <div class="col">
					                  <h5 class="row text-primary mt-2">창작자 이름</h5>
					                  <h6 class="row text-muted">창작자 이메일</h6>
					                  <h6 class="row text-muted" onclick="location.href='creatorSearch?=id'">올린 프로젝트 더보기</h6>
					                </div>
					              </li>
								<!-- 창작자 list end -->
							</div>
						</div>
					</div>
				</div>
				<div class="container py-4">
					<h4>
						<a>이런 프로젝트는 어떠세요?</a>
					</h4>
					<%@ include file="projectSuggest.jsp"%>

				</div>
			</div>
	</section>


	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>