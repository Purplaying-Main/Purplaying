<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<!--메인 컨테이너 -->
	<section>
		<h1 class="visually-hidden">HOME</h1>
		<div class="album">
		<div class="container py-4">
			<!-- genre div start -->
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="ProjectDto" items="${list_ps }">
				<c:set var="doneloop"  value="false"/>
	            <div class="col"><!-- project thumb start -->
	              <div class="card shadow-sm">
	                <!-- 좋아요 버튼 -->
	                 <c:forEach var="like" items="${Likelist }" varStatus="status">
	                 	<c:if test="${not doneloop }">
		                	<c:choose>
		                		<c:when test="${like eq ProjectDto.prdt_id }">
		                			<c:set var="i" value="true" />
		                			<c:set var="doneloop"  value="true"/>
		                		</c:when>
		                		<c:otherwise><c:set var="i" value="false" /></c:otherwise>
		                	</c:choose>
	                	</c:if>
	                </c:forEach>
	                <button class="likeBtn" onclick="clickBtntest()"><i class="fa-regular fa-heart ${i? 'fas active' : 'far' }"></i></button>
		                <div onclick="location.href='/purplaying/project/${ProjectDto.prdt_id}'" id="${ProjectDto.prdt_id }" style="cursor:pointer">				
							<img class="bd-placeholder-img" width="100%" height="225" id="prdt_thumbnail" name="prdt_thumbnail"
                		src="${ProjectDto.prdt_thumbnail}" style=" ${ProjectDto.prdt_thumbnail == null ? 'display:none' : '' }">
                		</div>
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
			</div><!-- project row end -->
		</div>
		</div>
		<!-- genre div end -->

	</section>
</body>
</html>