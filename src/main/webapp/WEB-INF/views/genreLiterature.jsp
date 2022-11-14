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
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
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
        <div class="dropdown container">
          <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            달성률
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">최신등록순</a></li>
            <li><a class="dropdown-item" href="#">관심많은순</a></li>
          </ul>
        </div>
        <div class="container py-4"><!-- genre div start -->
          <h4>문학</h4>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          	<c:forEach var="genreDto" items="${list_gl }">        
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                 <div class="card-body">
                  <p class="card-cate" onclick="location.href='literature'">
                  <c:choose>
                  	<c:when test="${ genreDto.prdt_genre eq 1}">문학</c:when>
                  	<c:otherwise>장르</c:otherwise>
                  </c:choose>
                  </p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>${genreDto.prdt_name }</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 ${genreDto.prdt_percent }%</strong>
                    	<small class="text-muted"><fmt:formatNumber type="number" maxFractionDigits="3" value="${genreDto.prdt_currenttotal }"></fmt:formatNumber>원</small>
                    	<small class="text-muted text-end">${genreDto.prdt_dday}일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${genreDto.prdt_percent }%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
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
	const perValue = ${genreDto.prdt_percent };
	if(perValue >= 100) {perValue = 100;}
	</script>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>