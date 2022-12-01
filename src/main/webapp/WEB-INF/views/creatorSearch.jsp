<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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
					<p></p>
				</div>
				<div class="container py-4">
					<!-- profil div start -->

					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<div class="col">
							<!-- project thumb start -->

							<li class="row d-flex border rounded p-3 m-1">
								<div class="col-4">
									<img src="https://picsum.photos/90"
										class="img-thumbnail rounded-circle" alt="유저 프로필">
								</div>
								<div class="col">
									<h5 class="row text-primary mt-2">${writer}</h5>
									<h6 class="row text-muted">창작자 이메일</h6>
								</div>
							</li>

						</div>
					</div>
				</div>
				<!-- profil div end -->
				<div class="container py-4">
					<!-- genre div start -->
					<h4>
						<a>진행 프로젝트</a>
					</h4>
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach var="ProjectDto" items="${list_project }">
						<div class="col"><!-- project thumb start -->
			              <div class="card shadow-sm">
			                <!-- 좋아요 버튼 -->
			                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far"></i></button>
			                <div onclick="location.href='/purplaying/project/${ProjectDto.prdt_id}'" style="cursor:pointer">
								<img class="bd-placeholder-img" width="100%" height="225" id="prdt_thumbnail" name="prdt_thumbnail"
			                		src="${ProjectDto.prdt_thumbnail}" style=" ${ProjectDto.prdt_thumbnail == null ? 'display:none' : '' }">                </div>
			                <div class="card-body">
			                  	<c:choose>
			                  		<c:when test="${ProjectDto.prdt_genre eq 1 }"><p class="card-cate" onclick="location.href='genre/literature'">문학</p></c:when>
			                  		<c:when test="${ProjectDto.prdt_genre eq 2 }"><p class="card-cate" onclick="location.href='genre/poemessay'">시/에세이</p></c:when>
			                  		<c:when test="${ProjectDto.prdt_genre eq 3 }"><p class="card-cate" onclick="location.href='genre/webtoon'">웹툰</p></c:when>
			                  		<c:otherwise><p class="card-cate">장르</p></c:otherwise>
			                  	</c:choose>
			                  <div class="link-div" onclick="location.href='/purplaying/project/${ProjectDto.prdt_id}'">
				                  <p class="card-text"><h5>${ProjectDto.prdt_name }</h5></p>
			                   </div>
				                  <div class="d-flex justify-content-between align-items-center">
			                     	<strong class="text-danger">현재 달성률 ${ProjectDto.prdt_percent }%</strong>
			                    	<small class="text-muted"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ProjectDto.prdt_currenttotal }"></fmt:formatNumber>원</small>
			                    	<small class="text-muted text-end">${ProjectDto.prdt_dday}일 남음</small>
			                  	</div>
			                  <div class="progress">
			                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped example" style="width: ${ProjectDto.prdt_percent }%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
			                  </div>
			                </div>
			              </div>
			            </div><!-- project thumb end -->
						</c:forEach>
					</div>
					<!-- project row end -->
				</div>

			</div>
	</section>


	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>