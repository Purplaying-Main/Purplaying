<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  	<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  	<%@ include file ="meta.jsp" %>
	<link rel="stylesheet" href="resources/assets/css/heart.css">
	<link rel="stylesheet" href="resources/assets/css/indexHover.css">
	<script src="resources/assets/js/heart.js"></script>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
 
  <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <!-- 펀딩 프로젝트 -->
      <div class="album">
        <div class="container py-4"><!-- genre div start -->
          <h3>New! 신규펀딩✨</h3>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          	<c:forEach var="ProjectDto" items="${list_n }">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far"></i></button>
                <div onclick="location.href='/purplaying/project/${ProjectDto.prdt_id}'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
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
        </div><!-- genre div end -->
      </div>
    </div>

  </section>
	<script>
	/*progressbar 연동 JS*/
	const perValue = ${ProjectDto.prdt_percent };
	if(perValue >= 100) {perValue = 100;}
	</script>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>