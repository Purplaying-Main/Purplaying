<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
  <!-- 카로셀 -->
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active" id="item02">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>물고기는 존재하지 않는다</h1>
            <p>다양한 사람들이 모여 한 권의 책을 추천합니다.</p>
            <p><a class="btn btn-outline-secondary" href="/purplaying/projectdetail">자세히보기</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item"  id="item01">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>화제의 번역서 원서로 읽기</h1>
            <p>읽고 싶었던 원서 번역 펀딩하기</p>
            <p><a class="btn btn-outline-secondary" href="/purplaying/fundingguide">펀딩 가이드</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item" id="item03">
        <div class="container">
          <div class="carousel-caption text-start">
            <!-- <h1>2022 노벨문학상, 아니 에르노</h1>
            <p>Some representative placeholder content for the third slide of this carousel.</p> -->
            <p><a class="btn btn-outline-secondary" href="/purplaying/projectdetail">자세히보기</a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <!-- 펀딩 프로젝트 -->
      <div class="album py-5">
        <div class="container">
          <h4 class="mb-2"><a href="/purplaying/popularFunding">지금 달성률이 높은 펀딩🔥</a></h4>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-4">         
          <c:forEach var="indexDto" items="${list_p }">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                 <div class="card-body">         
                  <p class="card-cate" onclick="location.href='genreliterature'">
                  	<c:choose>
                  		<c:when test="${indexDto.prdt_gerne eq 1 }">문학</c:when>
                  		<c:when test="${indexDto.prdt_gerne eq 2 }">시/에세이</c:when>
                  		<c:when test="${indexDto.prdt_gerne eq 3 }">웹툰</c:when>
                  		<c:otherwise>장르</c:otherwise>
                  	</c:choose>
                  </p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>${indexDto.prdt_name }</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 ${indexDto.prdt_percent }%</strong>
                    	<small class="text-muted"><fmt:formatNumber type="number" maxFractionDigits="3" value="${indexDto.prdt_currenttotal }"></fmt:formatNumber>원</small>
                    	<small class="text-muted text-end">${indexDto.prdt_dday}일 남음</small>
                  	</div>          
                  <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped example" style="width: ${indexDto.prdt_percent }%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
          </c:forEach>
          </div>
         
          <h4 class="mb-2"><a href="/purplaying/newFunding">오늘의 신규 펀딩✨</a></h4>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-4">         
          	<c:forEach var="indexDto" items="${list_n }">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="card-body">
                  <p class="card-cate" onclick="location.href='genrewebtoon'">
                   	<c:choose>
                  		<c:when test="${indexDto.prdt_gerne eq 1 }">문학</c:when>
                  		<c:when test="${indexDto.prdt_gerne eq 2 }">시/에세이</c:when>
                  		<c:when test="${indexDto.prdt_gerne eq 3 }">웹툰</c:when>
                  		<c:otherwise>장르</c:otherwise>
                  	</c:choose>
                  </p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>${indexDto.prdt_name }</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 ${indexDto.prdt_percent }%</strong>
                    	<small class="text-muted"><fmt:formatNumber type="number" maxFractionDigits="3" value="${indexDto.prdt_currenttotal }"></fmt:formatNumber>원</small>
                    	<small class="text-muted text-end">${indexDto.prdt_dday}일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped example" style="width: ${indexDto.prdt_percent }%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
          	</c:forEach>
          </div>
        </div>
      </div>
    </div>
  </section>
	<script>
	/*progressbar 연동 JS*/
	const perValue = ${indexDto.prdt_percent };
	if(perValue >= 100) {perValue = 100;}
	</script>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>